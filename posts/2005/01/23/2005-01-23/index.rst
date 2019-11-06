.. title: Goodbye, PM3; Recent Reading
.. slug: 2005-01-23
.. date: 2005-01-23 00:00:00 UTC-05:00
.. tags: old blog,recent reading,pm3,modula-3
.. category: oldblog
.. link: 
.. description: 
.. type: text


.. role:: program(literal)

Goodbye, PM3
------------

I have been cleaning some uncessary packages off ``tkb.mpl.com`` and in
the process accidently deleted ``pm3-forms``, a GUI library for the
Polytechnic Modula 3 implementation (PM3). Unfortunately, CVSup uses
the forms library, and I use CVSup extensively to keep the FreeBSD
source code and Ports up to date, so I can keep ``tkb.mpl.com`` up to
date. Unfortunately, I'd built PM3 back in the XFree86 days and have
since switched to Xorg and the dependencies in the other PM3 packages
would have caused rebuilding and reinstalling all the XFree86
packages. I had no desire to go back there, so I decided to delete all
the PM3 packages and CVSup and rebuild CVSup from scratch. Upon
consideration, I decided to use the ezm3 Modula 3 distribution instead
of PM3 ; the ezm3 distribution is specifically maintined to support
:program:`CVSup`, and since that's the only thing I'm using Modula 3 for any
more it makes sense to use the smaller but better maintained ezm3
instead of the bigger and more featureful but almost unmaintained PM3
distribution.

It's really a pity: the PM3 distribution had a lot of neat programs
included and Modula 3 is very interesting language and was used as the
building blocks for a lot of very interesting research, but today the
user base is too small to see much development with the language.
Personally, I think it has a lot going for it: it's a relatively small
language with a great number of features that showed up in other
languages of its kind only later: garbage collection, modules,
threads, objects, generics, and so on, in a very readable and
understandable way. In many ways it's a better language than many of
its successors.

Unfortunately, for my personal use, it doesn't go quite far enough in
one way: I've been spoiled by the convenience of higher level
languages like Dylan, Lisp, Scheme, and Objective Caml; and in another
way it has gone a little too far: interfacing to C is well defined,
but is not without some easily overlooked drawbacks. The situation was
not improved by the minor but pervasive incompatiblities between
classic Modula 3 on one side (the original DEC distribution, PM3, and
ezm3) and the enchanced version produced by Critical Mass (CM3). In
the end, it remains a language that, like Oberon-2 and Ada, I like,
but not enough to use regularly.

Recent Reading (Harlan)
-----------------------

+ *Wasteland of Flint*, by Thomas Harlan; Tor/Tom Doherty Associates,
  LLC, April 2003.  I devoured Harlan's earlier *Oath of Empire*, a
  fascinating fantasy set in an alternate Roman Empire, so I was
  overjoyed to find he has started a new series, beginning with this
  book. This time it's science fiction, but again it's alternate
  history, set in the future in a universe where the Aztec empire rules
  Earth and has expanded to the stars. It's a good book that kept me
  interested to the last and looking forward to the next book in the
  series, *House of Reeds*.
