.. title: FreeBSD and darcs
.. slug: 2005-05-24
.. date: 2005-05-24 00:00:00 UTC-05:00
.. tags: old blog,freebsd,darcs
.. category: oldblog
.. link: 
.. description: 
.. type: text


The `darcs <http://abridgegame.org/darcs/>`__ `port
<http://www.freebsd.org/cgi/ports.cgi?query=darcs&stype=all>`__ on
`FreeBSD <http://www.freebsd.org/>`__ has been marked as BROKEN for
a while; here's the `explanation
<http://lists.freebsd.org/pipermail/freebsd-
ports/2005-April/022449.html>`__. Basically, darcs 1.0.2 used some
`ghc <http://www.haskell.org/ghc/>`__ internal APIs that changed with
ghc 6.4. I was able to compile darcs 1.0.2 ok though, since my machine
still has 6.2.2 installed because the ghc 6.4_1 port wouldn't compile.
