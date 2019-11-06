.. title: VMS Code from the Past
.. slug: 2003-05-08
.. date: 2003-05-08 00:00:00 UTC-05:00
.. tags: old blog,vms,basic,mmk,poise,dms-plus
.. category: oldblog
.. link: 
.. description: 
.. type: text


Listening to: Hawkwind, `Chronicle of the Black Sword <http://www.fre
edb.org/freedb_search_fmt.php?cat=rock&id=d50ba50e>`__.

I've been reading a lot of VMS BASIC [1]_ source code from the early
1990s [2]_ recently, and the one lesson it has taught me is that
refactoring source code is vital for maintainability.  Much of this
source code originated in one program that was copied and edited
whenever a new program was needed, so each new program generally ended
up with a lot of rag-tag odds-and-ends code from the original program
that was not actually needed for the functionality of the new program.
Unfortunately, when one is trying to change some existing
functionality one has to look at each and every program *and figure
out if that functionality is actually implemented and used in that
program*, and to do this you have to mentally trace the execution of
the code! The moral? When you copy code, delete everything you don't
actually use! Refactor, refactor, refactor!

And why didn't we use ``%INCLUDE`` more? There are hundress of lines of
external function declarations that are used time and again in several
programs; we should have put them in a couple of include files.

I really wish VMS Basic allowed `redimensioning array formal
parameters <http://groups.google.com/groups?q=tkb+group:comp.os.vms&hl
=en&lr=&ie=UTF-8&oe=UTF-8&selm=a3db6b24.0305081211.6f867ad0%40posting.
google.com&rnum=1>`__, but I understand why it's not allowed.  (Perhaps
there should have been a specific descriptor for arrays that can be
redimensioned?)

I was shocked to rediscover that there was no way of reliably building
the system from the source code.  MMS was too expensive for us at the
time and if `MMK <http://www.madgoat.com/mmk.html>`__ existed we
didn't know about it.  We used a bunch of ad-hoc DCL command
procecudures to compile whatever program we were working on (most of
them were all in one source file, and linked against one library of
utility routines) and these were never collected.  So, you couldn't
easily tell if the current set of executables was actually built from
up-to-date source.  Since I've been doing the odd bit of maintenance on
this system every six months or so I finally broke down and created
``DESCRIP.MMS`` files for use with MMK, and I'm much easier in my mind
now.

There were a number of things in this system that I think were well
done, though, so it hasn't been all pain looking at it again.




.. [1] I'm working with it on an Alpha so I can't call it VAX BASIC
   anymore.

.. [2] The original version of this system ran on PDP-11 running RSTS/E.
   I've been involved in two major conversions of systems running on
   PDP-11 RSTS/E to VAX/VMS, both using the POISE DMS-Plus on both RSTS/E and
   VMS, with extensive homegrown applications written in VMS BASIC and
   using the POISE SPL API.

2014-11-03
==========

Here's the text of my post to comp.os.vms:

    The BASIC for OpenVMS Reference Manual says, in the fifth item of the
    Remarks section:

	The executable DIM statement cannot be used to dimension virtual arrays,
	arrays received as formal parameters, or arrays declared in COMMON, MAP,
	or nonexecutable DIM statements.

	http://h71000.www7.hp.com/doc/73final/cobol/bas_ref_013.htm#noisn

    The "no formal parameters" rule is inconvienent.  It means that you
    can't pass an array to a function, redimension it, fill it with values,
    and then use LBOUND and UBOUND in the caller to find out its new size.

    Presumably it is illegal because there is no way at compile time to
    know if the function will be called with a dynamic array created with
    the executable DIM statement or a static array created with a
    non-executable DIM statement.

    However, the programmer *can* know, so it ought to be safe to
    redimension the array directly when the programmer knows it was
    created by an executable DIM statement.  

    Using Alpha BASIC V1.4-000 under OpenVMS V7.2 and looking at the
    listing of some code with some executable dimension statements
    compiled with /LIST/MACHINE revealed the existance of DBASIC$RT_DIM
    and after a little experimentation lead to a program that used
    DBASIC$RT_DIM directly to redimension dynamically dimensioned arrays
    in functions, included below.

    DBASIC$RT_DIM is not documented for users (probably by design) and
    could *theoretically* lead to flying monkeys and access violations,
    and is probably bad style.  However, are there any *practical*
    reasons why this wouldn't work safely?  Are there any
    conditions under which this hack would fail to work?

    Here is an example program:

    .. code::

	program redim
	    option type = explicit, constant type = integer, &
		size = integer long, size = real double

	    external sub redim_in_sub (string dim())
	    external long function my_redim (string dim(), long)

	    declare long i, r

	    i = 10
	    dim string vs(i) ! has to be a variable to make it an executable dim.

	    r = my_redim (vs(), 30)
	    print "ubound(vs):"; ubound(vs)
	    for i = lbound(vs) to ubound(vs) \ vs(i) = "vs 30-" + num1$(i) \ next i
	    gosub print_vs

	    call redim_in_sub (vs())
	    print "ubound(vs):"; ubound(vs)
	    gosub print_Vs

	    exit program

	print_vs:
	    for i = lbound(vs) to ubound(vs) \ print i; ": "; vs(i) \ next i
	    return ! from print_vs

	end program ! redim

	function long my_redim (long s by value, long n)
	    option type = explicit, constant type = integer, &
		size = integer long, size = real double
	    declare long r
	    external long function dbasic$rt_dim (long by value, long by value)    
	    r = dbasic$rt_dim (s, n)
	end function r ! my_redim

	sub redim_in_sub (string s())
	    option type = explicit, constant type = integer, &
		size = integer long, size = real double
	    external sub set_strings (string dim(), string)
	    declare long i
	    call my_redim (s(), 40)
	    for i = 0 to 40 \ s(i) = "redim in sub " + num1$(i) \ next i
	end sub ! redim_in_sub


    (Interestingly, a slightly different approach was necessary using VAX
    BASIC V3.5 under VMS V5.5-2: using BY VALUE in function
    definition statements is not allowed by this version of VAX BASIC,
    and BAS$RT_DIM had to be used instead of DBASIC$RT_DIM, of course.)
