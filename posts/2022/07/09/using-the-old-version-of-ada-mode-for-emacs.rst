.. title: Using the old version of Ada Mode for Emacs
.. slug: using-the-old-version-of-ada-mode-for-emacs
.. date: 2022-07-09 22:20:40 UTC-04:00
.. tags: ada,ada-mode,ada-mode.el,emacs
.. category: 
.. link: 
.. description: 
.. type: text

.. role:: app

There are a lot of things to like about the Ada_ programming language;
it seems to have a solid core of users, enough to support multiple
commercial implementations and an implementation that is part of the
`GNU Compiler Collection`_.  I occasionally use it myself.

.. _GNU Compiler Collection: https://gcc.gnu.org/

**However:** I'm sure that the current version of `Ada Mode`_ for Emacs_
(available as an ELPA_ package_, and thus not included in :app:`Emacs`
itself), which provides smart editing for the Ada_ programming
language, and uses an external parser for the indentation,
fontification, and navigation engine, is wonderful if you can get it
working, but I have **never** been able to get it to work.  My most
recent try was today on Fedora 36 using GNAT 12.1.1 20220507 (Red Hat
12.1.1-1).  Sigh.  Without the external parser the current `Ada Mode`_
is completely unworkable.

.. _Ada Mode: https://www.nongnu.org/ada-mode/
.. _Emacs: https://www.gnu.org/software/emacs/
.. _ELPA: https://elpa.gnu.org/
.. _package: https://elpa.gnu.org/packages/ada-mode.html
.. _Ada: https://en.wikipedia.org/wiki/Ada_(programming_language)

However, when I did some Ada work a number of years ago, I was quite
happy with the version that used to be in :app:`Emacs` itself.  So I
dug it out of the `Emacs git repository`_ at `savannah.gnu.org`_.
Basically, cloned the git repository and then figured out what commit
it was deleted in by doing::

  $ git rev-list HEAD -n 1 -- lisp/progmodes/ada-mode.el
  a13c64204c8ead966789abf8efe176e4f2d4f599

Then I checked out the files involved::

  $ git checkout a13c64204c8ead966789abf8efe176e4f2d4f599^ lisp/progmodes/ada-mode.el lisp/progmodes/ada-prj.el lisp/progmodes/ada-stmt.el lisp/progmodes/ada-xref.el doc/misc/ada-mode.texi

The ``^`` at the end of the commit hash says to get the previous
commit.

And I've put the files in a `zip file`_ for anybody who is in the same
situation as I was.

.. _Emacs git repository: https://savannah.gnu.org/git/?group=emacs
.. _savannah.gnu.org: https://savannah.gnu.org
.. _zip file: /emacs/old-ada-mode.zip

Just put them somewhere on your ``load-path`` and add ``(autoload
'ada-mode "ada-mode")`` to your emacs config file.

