.. title: Common Lisp, SBCL, and CLIM; Recent Reading
.. slug: 2003-11-22-sbcl-author-of-the-century
   
.. date: 2003-11-22 00:00:00 UTC-05:00
.. tags: old blog,recent reading,common lisp,sbcl,clim
.. category: oldblog
.. link: 
.. description: 
.. type: text


Common Lisp, SBCL, and CLIM
---------------------------

I finally took the time to figure out how to install `McCLIM
<http://clim.mikemac.com/>`__ under FreeBSD.  The first thing to do was
install `SBCL <http://sbcl.sourceforge.net/>`__ from scratch; the
FreeBSD port doesn't install all the SBCL extras, but they're needed
to build McCLIM, especially ASDF.  The other things I needed to do were
described in the ``INSTALL.SBCL`` from the McCLIM release.  I had to
install `CLX <http://www.cliki.net/CLX>`__ for SBCL using ASDF.  This
proceeded with only one hitch: I needed a `~/.sbcl/trusted-uids.lisp`
for some reason.  Once that was done it was easy to build McCLIM for
SBCL and run the demo applications.  Now that I know how to build
McCLIM I'll be able to investigate CLIM.

Recent Reading
--------------

.. _author-of-the-century:

+ `J.R.R. Tolkien: Author of the Century`, by Tom Shippey.  I think I
  must have read `The Hobbit` and `The Lord of the Rings` for the first
  time in 1977, when I was still quite young, and like many was
  captivated immediately.  I read it again many times and enjoyed it just
  as much each time.  It's one of those books that I return to and re-
  read every few years.  I would not, however, have thought of Tolkien as
  the “Author of the Century”, but in this book and `The Road to
  Middle-Earth` Shippey makes a very persuasive argument for just that,
  pointing out that Tolkien may well have been the person with the
  *deepest* understanding of the English *language* in this century, and
  showing how his professional background as a philologist and language
  scholar formed his fiction.  In any case, both books made me appreciate
  much better the subtlety and depth of Tolkien's fiction and has the
  best possible outcome for literary analysis: it made me want to read
  the books again, as well as look further into the books edited by
  J.R.R Tolkien's son, Christopher Tolkien.  I've read the `The
  Silmarillion` and `Unfinished Tales of Númenor and Middle Earth`, but
  I've not read any of the twelve volume of `The History of Middle
  Earth`, and I think after this it would be interesting to do so.
