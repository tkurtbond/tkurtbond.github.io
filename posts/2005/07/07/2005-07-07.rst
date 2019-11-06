.. title: Recent Reading; ghc 6.5
.. slug: 2005-07-07
.. date: 2005-07-07 00:00:00 UTC-05:00
.. tags: old blog,recent reading
.. category: oldblog
.. link: 
.. description: 
.. type: text


Recent Reading
--------------

+ *The Glory That Was*, by L. Sprague De Camp; introduction by Robert
  A. Heinlein; copyright 1952 by Better Publications, Inc.; copyright
  1960 by L. Sprague de Camp; A Baen Book, Baen Publishing Enterprises,
  first Bean printing, April 1992.  In the past I've had a habit of buying
  books that I know I'll want to read at some time in the future and
  then not reading them for years. This book is a case in point. I
  expect I've had this book since 1993 or there-abouts, and I've finally
  found myself in the mood to read it. I'm definitely glad I picked it
  up. It's a light and intertaining science fantasy..

ghc 6.4
-------

It turns out that `ghc <http://www.haskell.org/ghc/>`__ 6.4 takes more
VM to build than 6.2 did; the 256 `MiBs
<http://physics.nist.gov/cuu/Units/binary.html>`__ of memory and 256
MiBs of swap on my FreeBSD server were not enough. I added another GiB
of swap and it compiled ok, if slowly.
