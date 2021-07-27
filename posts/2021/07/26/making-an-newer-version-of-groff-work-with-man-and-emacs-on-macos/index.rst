.. title: Making an newer version of groff work with man and emacs on macOS
.. slug: making-an-newer-version-of-groff-work-with-man-and-emacs-on-macos
.. date: 2021-07-26 17:30:19 UTC-04:00
.. tags: groff,troff,macos
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command
.. role:: man

I'm posting this mostly to remind myself if I ever have to fiddle with
this again.

I use a version of :app:`groff` installed from :app:`git` because some
of my documents depend on fixes that are coming out in the next
release, 1.23.0.  I install it on my macOS machine in
:file:`/usr/local/sw/versions/groff/git`.  (The directory hierarchy
under :file:`/usr/local/sw/versions` is where I put programs that I
compile from scratch, to keep them separated from the programs that
come from the operating system and/or package managers.  I often have
more than one version of a program installed, therefore the
:file:`versions` component of the name.)

Because the :command:`groff` that is first in my path is the new one I
installed, and because :app:`man` on macOS knows to look for man pages
according to what your ``PATH`` is, when I as ``man groff_ms`` I get
the new man page for ``groff_ms``.  Yay!  Unfortunately, it gets
rendered with the old :app:`groff` that macOS supplies, version
1.19.2, which doesn't include the ``.SY`` macro that current versions
of :app:`groff` supply in their :app:`man` macros, and which they
*use* in their man pages, so it renders wrong.  A typical example is
that when it renders :man:`groff_ms(7)` the ``groff -ms`` and
``groff -m ms`` are missing from the lines in the SYNOPSIS section.
Boo!

Luckily, :app:`man` takes a ``-C`` option that lets you specify an
alternate configuration file (on macOS the default one is in
:file:`/private/etc/man.conf`), so you can supply one that specifies
the absolute path to the newer :app:`groff` you are using.  So I added

.. code:: bash

   alias man='man -C ~/local/etc/man.conf'

to the appropriate shell startup file.  And I can add

.. code:: emacs-lisp

   (setq Man-switches "-C ~/local/etc/man.conf")

to my :app:`emacs` configuration so it uses the right version of
:app:`groff` too.

But a modern :app:`groff` produces ANSI escapes for bold and
underline, rather than the older convention of over-striking via the
backspace character with the same character for bold or with the
underscore character for underlining.  My pager, :app:`less`, can deal
with that, but something in :app:`emacs` doesn't like that, leaving
the buffer with :man:`groff_ms(7)` with underlining on every line.\
[#manual]_

Eventually I figured out that the old style over-striking via
backspaces worked just fine with emacs, so I added the ``-P-c`` option
to the invocation of :app:`groff` in the NROFF definition in my
modified :file:`man.conf` file.  That tells :command:`groff` to pass
the ``-c`` option to the :command:`grotty` output driver, which tells
it to use old-style backspace over-striking.

This seems overly complicated.

I suspect I'll need to do something different on the Linux boxes I
use.

Later
=====

Aannnd I was right.  Fedora 33 has a similar problem, which I fixed by
creating a :file:`~/.manpath` file with

.. code::

   DEFINE 	nroff 	/sw/versions/groff/git/bin/nroff -mandoc -P-c

in it.  I found the information I needed in :man:`manpath(5)`, which
documents the format of the :file:`/etc/man_db.conf` file.  (Why isn't
it :man:`man_db.conf(5)`, then?)


.. [#manual]

   Oddly, if I direct :app:`man`'s output to a file, visit that file in
   :app:`emacs`, and manually invoke the ``Man-fontify-manpage`` function
   :app:`emacs` uses to fontify the man page, it *doesn't* end up
   erroneously underlined.


*Last edited: 2021-07-26 22:34:57 EDT*

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
