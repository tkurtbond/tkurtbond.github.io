.. title: Fixing a 41 year old bug in the SWTOOLS VOS SEDIT commmand
.. slug: fixing-a-41-year-old-bug-in-the-swtools-vos-sedit-commmand
.. date: 2024-07-15 14:09:45 UTC-04:00
.. tags: software tools,lbl tools,swtools, software tools virtual operating system, ratfor, fortran
.. category: computer/software-tools
.. link: 
.. description: 
.. type: text

.. role:: command
.. role:: file
.. role:: app

Today I fixed a 41 year old bug in the SWTOOLS VOS :command:`sedit` commmand!

At work part of my job is to maintain an emulated VAX/VMS 5.5-2 system
for one of our clients.  I have been using the SWTOOLS Virtual
Operating System `recently <link://slug/software-tools>`_ (Unix style
I/O redirection! And pipes!), and whenever I tried to use the sedit
command it would die with an integer overflow::

  %SYSTEM-F-INTOVF, arithmetic trap, integer overflow at PC=0002D6C9, PSL=03C00022

  Improperly handled condition, image exit forced.

        Signal arguments              Stack contents

        Number = 00000003                00000000
        Name   = 0000047C                08000020
                 0002D6C9                000017C4
                 03C00022                7FEF9784
                                         0002D479
                                         00001DC0
                                         00000000
                                         08000020
                                         7FEF97B4
                                         7FEF979C

        Register dump

        R0 = 0000000E  R1 = 0002BAF4  R2 = 0000000F  R3 = 7FF6A489
        R4 = 7FFE5E0C  R5 = 7FFE5EBC  R6 = 00000000  R7 = 00000001
        R8 = 7FFECA4C  R9 = 7FFECC54  R10= 7FFED7D4  R11= 00001E94
        AP = 7FEF9738  FP = 7FEF96F8  SP = 7FEF976C  PC = 0002D6C9
        PSL= 03C00022

Drats, drats, drats.

I use :command:`sed` frequently on Unix, and it would be nice to have
the SWTOOLS equivalent on VAX/VMS.  What could I do but set the
`Wayback Machine
<https://en.wikipedia.org/wiki/Wayback_Machine_(Peabody%27s_Improbable_History)>`_
for 1986 and dive in!

Those following along may want to read my post about how the `Software Tools VOS organized its source files <slug://how-the-lbl-software-tools-system-organized-its-source-files>`_ first.

The SWTOOLS VOS was written in `Ratfor
<https://en.wikipedia.org/wiki/Ratfor>`_, which added structured
control structures and other niceties such as macros, include files,
and string constants to pre-1977 Fortran.  I suspect that even as late
as 1986, when the version of the SWTOOLS VOS was released, lots of
installations were on machines that only ***had*** pre-1977 Fortran
compilers.

Here's an example of :app:`Ratfor` source, from :file:`sedit.r`:

.. code:: fortran

   # copyf - copy file name to opened file fdo
   subroutine copyf(name, fdo)
   integer name(ARB)
   integer fdo
   integer fdi, i
   integer open
   character c, namstr(MAXLINE)
   character getch

   for (i=1; name(i)!=EOS; i=i+1)               #get name into string
        namstr(i) = name(i)
   namstr(i) = EOS
   fdi = open(namstr, READ)
   if (fdi == ERR)
      call cant(namstr)
   while (getch(c, fdi) != EOF)
      call putch(c, fdo)
   call close(fdi)
   return
   end

You can tell it was inspired by Unix.

Here's the corresponding generated Fortran

.. code:: fortran

         SUBROUTINE COPYF(NAME, FDO)
         INTEGER NAME(2048)
         INTEGER FDO
         INTEGER FDI, I
         INTEGER OPEN
         LOGICAL*1 C, NAMSTR(2048)
         LOGICAL*1 GETCH
         I=1
   23190 IF (.NOT.(NAME(I).NE.0))GOTO 23192
         NAMSTR(I) = NAME(I)
   23191 I=I+1
         GOTO 23190
   23192 CONTINUE
         NAMSTR(I) = 0
         FDI = OPEN(NAMSTR, 1)
         IF (.NOT.(FDI .EQ. -3))GOTO 23193
         CALL CANT(NAMSTR)
   23193 CONTINUE
   23195 IF (.NOT.(GETCH(C, FDI) .NE. -1))GOTO 23196
         CALL PUTCH(C, FDO)
         GOTO 23195
   23196 CONTINUE
         CALL CLOSE(FDI)
         RETURN
         END

Notice that the ``character`` variables got changed to ``LOGICAL*1``?
That turns out to be 1 byte variable...

So, to start, I needed to run sedit in the debugger.  That's easy
enough::

   % cd ~tmp
   % mkdir sedit
   % cd sedit
   /dua1/software/swtools/tmp/sedit/
   % get -r1.5 ~src/sedit.tcs >sedit.w
   % ar xv sedit.w
   patdef
   csedit
   sedit.r
   sedit.fmt
   % rc -d -v sedit.r
   ~bin/ratp1.exe sedit.r | ~bin/ratp2.exe >sedit.f
   ~bin/fc.exe -v -d sedit.f
   for/noop/object=sedit.obj/nolist/check=all/debug=all sedit.f
   ~bin/ld.exe -v -d sedit.obj
   $ link/exe=dua1:[software.swtools.tmp.sedit]sedit.exe/debug/nomap sys$input/opti
   ons
   dua1:[software.swtools.tmp.sedit]sedit.obj,-
   dua1:[software.swtools.bin]rlib.olb/incl=(tools$main),-
   dua1:[software.swtools.bin]rlib.olb/libr
   % echo Hello | sedit "s/H/J/"
   %DEBUG-I-CANTCREATEMAIN, could not create the debugger subprocess
   %DEBUG-I-CANTCREATEMAIN, could not create the debugger subprocess
   -LIB-F-NOCLI, no CLI present to perform function
   -LIB-F-NOCLI, no CLI present to perform function
   %DEBUG-I-SHRPRC, debugger will share user process
   %DEBUG-I-SHRPRC, debugger will share user process

            VAX DEBUG Version V5.5-023

   %DEBUG-I-INITIAL, language is MACRO, module set to TOOLS$MAIN

   DBG> go
   %DEBUG-I-DYNMODSET, setting module DOCOM
   %SYSTEM-F-INTOVF, arithmetic trap, integer overflow at PC=0002E345, PSL=03C00022
   break on unhandled exception preceding DOCOM\%LINE 20
       20:       IF (.NOT.(CMD .EQ. 97))GOTO 23162
   DBG> go
   %DEBUG-I-DYNMODSET, setting module DOCOM
   %SYSTEM-F-INTOVF, arithmetic trap, integer overflow at PC=0002E345, PSL=03C00022
   break on unhandled exception preceding DOCOM\%LINE 20
       20:       IF (.NOT.(CMD .EQ. 97))GOTO 23162
   DBG> 

I guess we'll need a little more context.
   
.. code::

   DBG> type docom\1:20
   module DOCOM
        1:       SUBROUTINE DOCOM(I, LINBUF, LINENO)
        2:       LOGICAL*1 LINBUF(2048)
        3:       INTEGER I, LINENO
        4:       LOGICAL*1 CMD
        5:       INTEGER K1, K2
        6:       INTEGER AQ
        7:       INTEGER IQ
        8:       INTEGER BUF
        9:       INTEGER LASTBF
       10:       INTEGER NLINES
       11:       INTEGER LINE1
       12:       INTEGER LINE2
       13:       INTEGER PAT
       14:       INTEGER PREVC
       15:       INTEGER NFLAG
       16:       INTEGER QFLAG
       17:       COMMON /CSEDIT/ AQ, IQ, BUF(20000), LASTBF, NLINES, LINE1, LINE2, 
       18:      *PAT(132), PREVC, NFLAG, QFLAG
       19:       CMD = BUF(I+5)
       20:       IF (.NOT.(CMD .EQ. 97))GOTO 23162
   DBG>

Ok, line 19 is where the the integer overflow happened.  ``BUF`` is an
array of ``INTEGER``\ s, while ``CMD`` is a ``LOGICAL*1``, which, if I
look at the :file:`sedit.r` source:

.. code:: fortran

   # docom - execute a single command at buf(i) on linbuf and lineno
      subroutine docom(i, linbuf, lineno)
      character linbuf(MAXLINE)
      integer i, lineno
      character cmd
      integer k1, k2
      include csedit

      cmd = buf(i+COMMAND)
      …

started as a ``character`` and got translated to a ``LOGICAL*1``, the
one byte logical data type.  Normally that's ok, because we're just working
with ASCII, so any character should fit in in one byte.  Lets take a look:
     
.. code:: 

   DBG> ex buf[i+5]
   DOCOM\BUF[19]:  00000173
   DBG> 

Oh dear.  That's hexadecimal 173, which is decimal 371.  No wonder we
got an arithmetic trap, integer overflow.

If I look for occurrences of ``buf`` in :file:`sedit.r` (using emacs
18.55.105) I see lots of lines like where ``buf`` is passed to
subroutine ``addint``, which is not documented in the manual pages,
unfortunately, but is in the runtime library :file:`RLIB.OLB`.  On
VAX/VMS the source for that is in :file:`~vms/rlib.w`:

.. code:: fortran

   # AddInt      Put int into intara if it fits, increment j
   # works with an array of integers

   integer function addint( int, intara, j, maxsiz)

   integer         int, j, maxsiz, intara(maxsiz)

   if( j > maxsiz )
     return(NO)

   intara(j) = int
   j = j + 1

   return(YES)
   end

Yes, that's just putting an integer in an array and incrementing the
variable that stores where the next one goes.

Ok, lets look at all the
``addint`` calls.

.. code:: fortran

   Lines matching "\\baddint\\b(" in buffer sedit.r.
   176:    if (addint(int, str, j, maxsiz) == NO)
   223:   status = addint(nlines, buf, lastbf, MAXBUF)
   224:   status = addint(0, buf, lastbf, MAXBUF)
   225:   status = addint(line1, buf, lastbf, MAXBUF)
   226:   status = addint(line2, buf, lastbf, MAXBUF)
   229:      status = addint(NOTSTATE, buf, lastbf, MAXBUF)
   235:      status = addint(OKSTATE, buf, lastbf, MAXBUF)
   236:   status = addint(com, buf, lastbf, MAXBUF)
   238:      status = addint(0, buf, lastbf, MAXBUF)
   242:      status = addint(0, buf, lastbf, MAXBUF)
   248:      status = addint(0, buf, lastbf, MAXBUF)
   256:      status = addint(0, buf, lastbf, MAXBUF)
   260:         status = addint(EOS, buf, lastbf, MAXBUF)
   269:         status = addint(gflag, buf, lastbf, MAXBUF)
   270:         status = addint(pflag, buf, lastbf, MAXBUF)
   271:         status = addint(lastbf+2, buf, lastbf, MAXBUF)
   273:         status = addint(lastbf+j+1, buf, lastbf, MAXBUF)
   276:         status = addint(EOS, buf, lastbf, MAXBUF)
   286:      status = addint(fdw, buf, lastbf, MAXBUF)
   452:   dotext = addint(EOS, buf, lastbf, MAXBUF)
   695:    if (addint(p(i), str, j, maxsiz) == NO)
   713:    if (addint( s(i), str, j, maxsiz) == NO)
   
   
Some of the things they're adding to ``buf`` are clearly integers
(``nlines``, and probably ``NOTSTATE`` and ``OKSTATE``), but those
``EOS`` are the SWTOOLS VOS equivalent of the C ``'\0'`` that ends a
string, so those particular ones definitely hold characters.

Well, if I want to debug that I'm going to have to rebuild the SWTOOLS
VOS with debugging turned on.  Investigating it turns out that I need
to add ``/DEBUG`` to the :command:`macro` and :command:`fortran`
commands in :file:`asmlib.com`, :file:`asmprm.com`, :file:`build.com`,
and :file:`compile.com` in :file:`~bin`, and then execute
:file:`~bin:toolgen.com`.

Once that is done I start stepping through various routines.
Eventually I figure out that it ``buf(19)`` is the element that ends
up with the 173 hex, and set a watch on it.  And indeed it is getting
passed a 173.  Sigh.

Doing a ``SHOW STACK`` in the :app:`VMS Debugger` shows that the
``addint()`` call that dies is in the subroutine ``compil()``.  Lets
take a look:

.. code::

   DBG> type compil\50:65
   module COMPIL
       50:       STATUS = ADDINT(LINE2, BUF, LASTBF, 20000)
       51:       COM = CLOWER(LIN(I))
       52:       IF (.NOT.(COM .EQ. 33))GOTO 23068
       53:       STATUS = ADDINT(1, BUF, LASTBF, 20000)
       54:       I = I+1
       55:       CALL SKIPBL(LIN, I)
       56:       COM = CLOWER(LIN(I))
       57:       GOTO 23069
       58: 23068 CONTINUE
       59:       STATUS = ADDINT(0, BUF, LASTBF, 20000)
       60: 23069 CONTINUE
       61:       STATUS = ADDINT(COM, BUF, LASTBF, 20000)
       62:       IF (.NOT.(COM .EQ. 97 .AND. FD .NE. 0))GOTO 23070
       63:       STATUS = ADDINT(0, BUF, LASTBF, 20000)
       64:       STATUS = DOTEXT(FD)
       65:       GOTO 23071
   DBG>  

Line 61 is the one that dies.  Here ``addint()`` is being passed the
variable ``COM``.  Lets take a look at the :app:`Ratfor` source for
its definition:

.. code:: fortran

   # compil - "compile" command in lin(i) from file fd, increment i
      subroutine compil(lin, fd)
      character lin(MAXLINE), com

Oh, look, ``com`` is a character, that gets translated by
:app:`Ratfor` to a ``LOGICAL*1``, and it is a byte, while the integers
that get passed in are longwords, which are 32 bytes long…  Uh,
doesn't Fortran pass everything by reference?  So ``addint()`` gets
passed the address of a byte, but interprets it as the address of a
longword, so it picks up 3 extra bytes.  For whatever reason, there is
a 1 in the byte right next to the byte for ``com``, so we get (hex,
remember) 173 instead of 73, which is the ASCII for ``s``, which the s
in our ``sedit "s/H/J/"``!

Ok, that should be easy to fix: introduce an integer temporary
variable, assign ``com`` to it, and pass it instead.

Here's the VMS diff::

   ************
   File DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.R;6
     206      integer comint
     207      integer fd
   ******
   File DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.R;1
     206      integer fd
   ************
   ************
   File DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.R;6
     237      comint = com
     238      status = addint(comint, buf, lastbf, MAXBUF)
     239      if (com == APPENDCOM & fd != NO) {
   ******
   File DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.R;1
     236      status = addint(com, buf, lastbf, MAXBUF)
     237      if (com == APPENDCOM & fd != NO) {
   ************

   Number of difference sections found: 2
   Number of difference records found: 3

   DIFFERENCES /IGNORE=()/MERGED=1/OUTPUT=DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.DIFF;1-
       DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.R;6-
       DUA1:[SOFTWARE.SWTOOLS.TMP]SEDIT.R;1

Recompile, lets see:

.. code::

   % echo Hello | sedit "s/H/J/"
   Jello
   % 

That did it!
