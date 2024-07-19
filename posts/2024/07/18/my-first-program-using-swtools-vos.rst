.. title: My first program using SWTOOLS VOS
.. slug: my-first-program-using-swtools-vos
.. date: 2024-07-18 16:10:56 UTC-04:00
.. tags: swtools vos,swtools ratfor,fortran,vax/vms
.. category: computer/swtools
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: command

Well, it's my first program using SWTOOLS VOS **this time around**.

So, I finished by first program using SWTOOLS.  It is a simple
directory lister, called l, that interprets all its arguments as as
file specifications to search for using normal RMS wildcards, or used
:file:`*.*` if not arguments are specified.  It only returns the files with
the highest version number, does not include the device, directory, or
version number in the output, and converts the filenames to lower
case.  It should only be used to list files in the current directory.
I needed it because I do things like

.. code:: shell

   l *.sdcl *.for | sedit 's/{?+}$/ar uv src.ar $1'

and I don't want any version numbers to end up in the names of the
archive members, and so on.

Rafor *is* much better than Fortran 77.  And Fortran has even more
footguns than C when it comes to using separately compiled functions
and subroutines, with no notices that I'd passed things with the wrong
type until I actually ran the program and got a register dump because
of an access violation.

I was not able to include things from
:file:`SYS$LIBRARY:FORSYSDEF.TLB` using the Fortran ``INCLUDE``
statement in ratfor, since it has its own include keyword , so I
separated that part of the program into its own Fortran source file.
Because that file wasn't run through ratfor I couldn't use the
standard macro definitions, like STDERR, so when I wanted to output
the filesnames, I just wrote a ratfor subroutine that would print them
and called that from the Fortran subroutine.  A little clunky, but it
worked.

Annoying, the :command:`fc` command (which compiles :file:`*.f` files to
objects) doesn't work when run under :command:`mmk`, so I had to write
a command procedure :file:`dommk` that does ``mmk/noact/out=tmp.com``
and ``@tmp.com`` to do the build.  (I think this was somehow due to
having multiple levels of subprocesses: :command:`mmk`\ 's and
:command:`rc`\ 's.)

Anyway, the program ended up 48 lines of ratfor in three files and 84
lines of Fortran.  The C program I started with was 170 lines (in one
file), but doesn't work with the SWTOOLS shell's notions of I/O
redirection.

*Last edited: 2024-07-19 12:44:44 EDT*

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
