.. title: Failing at Ada Again
.. slug: failing-at-ada-again
.. date: 2019-11-10 16:24:35 UTC-05:00
.. tags: ada
.. category: computing
.. link: 
.. description: 
.. type: text

Back on May 20th, 2019 I ordered a copy of `Programming in Ada`_ by
John Barnes and spent some time reading it and working with Ada.  I
get interested again in Ada periodically_.  In theory, I ought to like
programming in Ada — it's one of the last remaining widely used members
of the Pascal language family, which I like.  There is a distribution
of the `GNAT Community Edition`_ for macOS which bundles the GNAT_ Ada
compiler and some useful libraries.  But I could never get
comfortable.

+ GNAT Community Edition for macOS doesn't include GtkAda, so I
  couldn't easily write GUI programs.

+ Getting programming libraries was back to the old download and
  install it from scratch yourself method.  I find it much easier to
  use systems like Chicken Scheme's `Eggs Unlimited`_ to find and
  install software, or OCaml_'s opam_.

+ Brew_, a package manager for macOS, doesn't include GNAT and
  GtkAda. The case is better in MacPorts_ and much better on Fedora,
  but not good on Ubuntu.  I think there are are fewer packaged Ada
  libraries across the open source Unixes in general.

+ The lack of a garbage collector is annoying.

+ The type system is strict and not very flexible.

+ And especially irritating to me, I tried using  the Ada mode on GNU Elpa_ 
  and it didn't indent Ada code properly.

I think in my current programming environment using Ada is still a
difficult task.

.. _`Programming in Ada`: https://www.amazon.com/gp/product/110742481X/
.. _periodically: link://slug/2003-07-24-ada-cohen
.. _`GNAT Community Edition`: https://www.adacore.com/download
.. _GNAT: https://en.wikipedia.org/wiki/GNAT
.. _`Eggs Unlimited`: http://wiki.call-cc.org/chicken-projects/egg-index-5.html
.. _OCaml: https://ocaml.org/
.. _opam: https://opam.ocaml.org/
.. _brew: https://brew.sh
.. _MacPorts: https://www.macports.org/
.. _Elpa: https://elpa.gnu.org/
