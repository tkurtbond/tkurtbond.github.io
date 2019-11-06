.. title: Building Emacs and Unison on Windows XP
.. slug: 2005-02-16
.. date: 2005-02-16 00:00:00 UTC-05:00
.. tags: old blog,emacs,unison
.. category: oldblog
.. link: 
.. description: 
.. type: text


Building Emacs on Windows XP
-----------------------------

Results from a superficial exercise with very limited use or testing:

#. Use the instructions in `.../nt/INSTALL`.
#. Compiling release 21.4 with gcc and -no-cygwin completed, but
   produced an emacs.exe that died with an error when run, except when
   run under gdb, in which case not error was observed.
#. Compiling release 21.4 with Visual C completed and produced an
   emacs.exe that ran without error.
#. Compiling a version obtained from `Emacs CVS
   <http://savannah.gnu.org/cvs/?group=emacs>`__ with the current
   versions of MingW and MSYS completed and produced an emacs.exe that
   ran without error.

Building Unison 2.10.2 with GTK+ v2 on Windows XP
-------------------------------------------------

Short form: build ocaml mingw version using cygwin tools with -mno-
cygwin, get gtk2 development environment from the `Win32 GAIM
<http://gaim.sourceforge.net/win32/build.php>`__ folks, patch so ptty
handling is same as sun (die at runtime), use with MSYS ssh.
