.. title: Recent Reading; OCaml and a Rare FreeBSD binary incompatibility
.. slug: 2004-02-05
.. date: 2004-02-05 00:00:00 UTC-05:00
.. tags: old blog,recent reading,ocaml,freebsd
.. category: oldblog
.. link: 
.. description: 
.. type: text


.. role:: app

Recent Reading
--------------

+ *Goddess of the Ice Realm*, by David Drake; Tor, 2003.  Adequate
  fantasy; the setting is mildly interesting, though.
+ *Jupiter Myth*, by Lindsey Davis; Mysterious Press, 2003.  Another
  competent Marcus Didius Falco mystery.  Falco, Helena, and entourage
  are still in Britian.

OCaml and a Rare FreeBSD binary incompatibility
-----------------------------------------------

In a rare fit of binary incompatibility between versions of FreeBSD,
all my OCaml 3.07p2 programs that used the Unix library broke when I
upgraded to 5.2 because gethostbyaddr_r disappeared:

::

    $ increment 
    Fatal error: cannot load shared library dllunix
    Reason: /sw/versions/ocaml/3.07/lib/ocaml/stublibs/dllunix.so: Undefined symbol "gethostbyaddr_r"


See `this e-mail`__ for more information.

__ http://lists.freebsd.org/pipermail/freebsd-current/2003-December/016677.html

Reconfiguring and re-installing ocaml seems to have fixed the problem,
but once that was done I had to rebuild (almost) all my ocaml programs
and `unison <http://www.cis.upenn.edu/~bcpierce/unison/>`__, the file
synchronization program that I use.

This is notable mainly because of how rarely this sort of thing
happens to either FreeBSD or OCaml.

Looks like some other things have broken, too: `gimp
<http://www.gimp.org/>`__, for one.

I resolved all this by upgrading my ports using :app:`portupgrade`.
