.. title: Redimensioning formal parameter arrays in OpenVMS BASIC, Revisited
.. slug: redimensioning-formal-parameter-arrays-in-openvms-basic-revisited
.. date: 2022-02-05 16:08:22 UTC-05:00
.. tags: vms,basic,usenet,vax,alpha,hacks
.. category: computer/os/vms
.. link: 
.. description: 
.. type: text

.. role:: file

I was working on a program on a VAX today, and needed to redimension
dynamically allocated arrays that are passed to an external function.
I've done this in the past (an `old USENET post`_, and the `old blog
post`_ that mentions it), but this time I managed to simplify my
solution, and generalize it to work with both lower and upper bounds,
and so the same function would work with multiple VMS BASIC data
types.  Here's the `new USENET post`_.  (How's that for thread
necromancy?)

.. _old USENET post: https://groups.google.com/g/comp.os.vms/c/mVWznNVN17U/m/HE3L4N4nIJAJ
.. _old blog post: link://slug/vms-code-from-the-past
.. _new USENET post: https://groups.google.com/g/comp.os.vms/c/mVWznNVN17U/m/yuOAmQtQBAAJ

I'll include the code in this blog post, too, for ease of reference.
Here's :file:`vax_redim_best.bas`\ :

.. code::

   program vax_redim_best
       option type = explicit, constant type = integer, &
           size = integer long, size = real double 
       record rec
           string s = 13
           long   i
       end record rec     

       ! Don't declare the parameters, and everything works, even passing
       ! different types.
       external sub redim 

       declare long stat, i
       i = 1
       dim rec rec(1 to i)
       print "lbound (rec) at start: "; lbound (rec)
       print "ubound (rec) at start: "; ubound (rec)
       call redim (rec(), 3, 10)
       print "lbound (rec) after redim: "; lbound (rec)
       print "ubound (rec) after redim: "; ubound (rec)

       dim string s(1 to i)
       print "lbound (s) at start: "; lbound (s)
       print "ubound (s) at start: "; ubound (s)
       call redim (s(), 3, 10)
       print "lbound (s) after redim: "; lbound (s)
       print "ubound (s) after redim: "; ubound (s)

       dim long l(1 to i)
       print "lbound (l) at start: "; lbound (l)
       print "ubound (l) at start: "; ubound (l)
       call redim (l(), 3, 10)
       print "lbound (l) after redim: "; lbound (l)
       print "ubound (l) after redim: "; ubound (l)


   end program ! vax_redim_best

   function long redim (long s, long low, long high)
       option type = explicit, constant type = integer, &
           size = integer long, size = real double
       external long function bas$rt_dim_bounds (long by value, long by value, long by value)
       declare long r
       r = bas$rt_dim_bounds (loc (s), low, high)
   end function r ! redim
   
I'll just point out, which I failed to do in the `old USENET post`_ or
the `new USENET post`_, that you have to use a **variable** when using
the VMS BASIC ``dim`` statement or you get a fatal runtime error.  Ooops.

So use:

.. code::

   declare long i
   i = 5
   dim string s(1 to i) ! Notice that last thing is the variable, i
   redim (s, 3, 10)

If you had said:

.. code::

   dim string s(1 to 5) ! Notice that last thing is a constant, 5
   redim (s, 3, 10)

You'd have gotten the following error:

.. code::

   %BAS-F-PROLOSSOR, Internal error in VAX BASIC Run-Time Library.  Please submit an SPR
   -BAS-I-FROFUN, In external function ALT_REDIM
   -BAS-I-FROMOD, In module Y
   %TRACE-F-TRACEBACK, symbolic stack dump follows
   module name     routine name                     line       rel PC    abs PC

                                                              0004B2AA  0004B2AA
   ----- above condition handler called with exception 001A833C:
   %BAS-F-PROLOSSOR, Internal error in VAX BASIC Run-Time Library.  Please submit an SPR
   -BAS-I-FROFUN, In external function ALT_REDIM
   ----- end of exception message
                                                              0004B2AA  0004B2AA
   ----- above condition handler called with exception 001A833C:
   %BAS-F-PROLOSSOR, Internal error in VAX BASIC Run-Time Library.  Please submit an SPR
   ----- end of exception message
                                                              0004A352  0004A352
                                                              00054E37  00054E37
   ALT_REDIM       ALT_REDIM                          43      0000002E  00000AC2
   Y               Y                                  24      0000015D  0000095D   

Don't actually submit an SPR, of course: you did it to yourself by
using an undocumented VMS BASIC internal runtime function.

Oh, I don't have access to an Alpha these days, so I haven't tried it
there, but I imagine using something named ``DBASIC$RT_DIM_BOUNDS``
instead of ``DBASIC$RT_DIM`` would likely work there.
