.. title: Chicken 4.1.0 on Cygwin
.. slug: chicken-410-on-cygwin
.. date: 2009-09-03 15:24:59 UTC-05:00
.. tags: cygwin,chicken,scheme
.. category: computer/lisp
.. link: 
.. description: 
.. type: text


.. role:: inlinecode(literal)

Weird: after compiling and installing chicken_ with:

.. class: code

::

   make PLATFORM=cygwin PREFIX=/sw/versions/cygwin/chicken/4.1.0
   make PLATFORM=cygwin PREFIX=/sw/versions/cygwin/chicken/4.1.0 install

I had to copy ``/sw/versions/cygwin/chicken/4.1.0/lib/*.a`` to
``/sw/versions/cygwin/checkin/4.1.0/bin`` before it could link things
properly.  (I first noticed this while doing a
:inlinecode:`$ chicken-install ncurses`.)

.. _chicken: http://www.call-with-current-continuation.org/
