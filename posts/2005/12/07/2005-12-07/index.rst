.. title: Chicken and MinGW
.. slug: 2005-12-07
.. date: 2005-12-07 00:00:00 UTC-05:00
.. tags: old blog,chicken,scheme,mingw
.. category: oldblog
.. link: 
.. description: 
.. type: text


To get Chicken version 2.207 to compile with MinGW I had to change the
line in configure that read

::

    mingw_libdir=`mingw32-gcc -print-prog-name=ld | sed 's%/lib/gcc-lib/.*%/lib%'`

with

::

    mingw_libdir=`mingw32-gcc -print-prog-name=ld | sed 's%/lib/gcc/.*%/lib%'`

and copy ``posixwin.c`` over ``posix.c`` and ``uposixwin.c`` over
``uposix.c``.
