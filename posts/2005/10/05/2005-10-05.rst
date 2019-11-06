.. title: Slime Oddity
.. slug: 2005-10-05
.. date: 2005-10-05 00:00:00 UTC-05:00
.. tags: old blog,slime,common lisp
.. category: oldblog
.. link: 
.. description: 
.. type: text


For some reason, clisp version 2.35 installed from the FreeBSD ports
doesn't have ``:PC386`` in ``*FEATURES*``; without this, Slime from CVS
stops with a continuable error::

    ** - Continuable Error
    INTERN("*DOCUMENTATION*"): #<PACKAGE SYSTEM> is locked
    If you continue (by typing 'continue'): Ignore the lock and proceed
    The following restarts are also available:
    SKIP           :R1      skip (COMPILE-FILES-IF-NEEDED-SERIALLY #)
    STOP           :R2      stop loading file
    /extra/sw/src/slime/swank-loader.lisp
    ABORT          :R3      ABORT


And after that, even if you continue slime is never able to connect to
swank.
