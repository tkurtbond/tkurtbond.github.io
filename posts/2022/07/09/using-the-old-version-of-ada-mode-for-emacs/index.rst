.. title: Using the old version of Ada Mode for Emacs
.. slug: using-the-old-version-of-ada-mode-for-emacs
.. date: 2022-07-09 22:20:40 UTC-04:00
.. tags: ada,ada-mode,ada-mode.el,emacs,free/libre software
.. category: 
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file

There are a lot of things to like about the Ada_ programming language;
it seems to have a solid core of users, enough to support multiple
commercial implementations and a `free/libre software`_ implementation
that is part of the `GNU Compiler Collection`_.  I occasionally use it
myself.

.. _free/libre software: https://en.wikipedia.org/wiki/Free_software
.. _GNU Compiler Collection: https://gcc.gnu.org/

**However:** I'm sure that the current version of `Ada Mode`_ for
Emacs_ (available as an ELPA_ package_, and thus not included in
:app:`Emacs` itself), which provides smart editing for the Ada_
programming language, and uses an external parser for the indentation,
fontification\ [#fontification]_, and navigation engine, is wonderful
if you can get it working, but I have **never** been able to get it to
work.  My most recent try was today on Fedora 36 using GNAT 12.1.1
20220507 (Red Hat 12.1.1-1).

Here's what happened when I tried to build the Ada code for the
parser, which is supplied as part of the ``ada-mode``::

   $ ./build.sh
   ada_mode_wisi_parse.gpr:44:26: warning: object directory "obj" not found
   Setup
      [mkdir]        object directory for project Ada_Mode_Wisi_Parse
   Compile
      [Ada]          ada_mode_wisi_lalr_parse.ads
      [Ada]          ada_mode_wisi_lr1_parse.ads
      [Ada]          run_ada_lalr_parse.ads
      [Ada]          run_ada_lr1_parse.ads
      [Ada]          gpr_mode_wisi_parse.ads
      [Ada]          run_gpr_parse.ads
      [Ada]          gpr_query.adb
      [C]            wisitoken_grammar_re2c.c
      [C]            ada_re2c.c
      [C]            gpr_re2c.c
      [Ada]          ada_process_actions.adb
      [Ada]          ada_process_lr1_main.adb
      [Ada]          gen_run_wisi_lr_text_rep_parse.adb
      [Ada]          run_wisi_common_parse.adb
      [Ada]          wisi.adb
   gnatcoll-sql.adb:742:07: error: ambiguous expression (cannot resolve "Append")
   gnatcoll-sql.adb:742:07: error: possible interpretation at a-coinve.ads:280, instance at gnatcoll-sql.ads:1109
   gnatcoll-sql.adb:742:07: error: possible interpretation at a-coinve.ads:270, instance at gnatcoll-sql.ads:1109

      compilation of gpr_query.adb failed

   gprbuild: *** compilation phase failed

Sigh.  Without the external parser the current `Ada Mode`_ is
completely unworkable: it doesn't even do indentation correctly, much
less do fontification.

.. _Ada Mode: https://www.nongnu.org/ada-mode/
.. _Emacs: https://www.gnu.org/software/emacs/
.. _ELPA: https://elpa.gnu.org/
.. _package: https://elpa.gnu.org/packages/ada-mode.html
.. _Ada: https://en.wikipedia.org/wiki/Ada_(programming_language)

However, when I did some Ada work a number of years ago, I was ok
with the version that used to be in :app:`Emacs` itself.  So I dug it
out of the `Emacs git repository`_ at `savannah.gnu.org`_.  Basically,
I cloned the git repository and then figured out what commit it was
deleted in by doing::

  $ git rev-list HEAD -n 1 -- lisp/progmodes/ada-mode.el
  a13c64204c8ead966789abf8efe176e4f2d4f599

Then I checked out the files involved::

  $ git checkout a13c64204c8ead966789abf8efe176e4f2d4f599^ lisp/progmodes/ada-mode.el lisp/progmodes/ada-prj.el lisp/progmodes/ada-stmt.el lisp/progmodes/ada-xref.el doc/misc/ada-mode.texi

The ``^`` at the end of the commit hash says to get the previous
commit.

You'll also need :file:`doc/docstyle.texi` and
:file:`doc/docstyle.texi` if you want to build documentation from
:file:`ada-mode.texi`.

And I've put the files in a `zip file`_ for anybody who is in the same
situation as I was, along with the generated documentation files
:file:`.info`, :file:`.html`, and :file:`.pdf`.

.. _Emacs git repository: https://savannah.gnu.org/git/?group=emacs
.. _savannah.gnu.org: https://savannah.gnu.org
.. _zip file: /emacs/old-ada-mode.zip

Just put them somewhere on your ``load-path`` and add ``(autoload
'ada-mode "ada-mode")`` to your emacs config file.

I'm sure the current `Ada Mode`_ has a lot more useful features, and
I'd love to use it, but
this at least lets me edit with automatic indentation, formatting, and
fontification.

.. [#fontification]

   ‘Fontification’ is the process of displaying source code with
   different font properties (such as color and typeface) for
   differing syntactic roles.  Emacs_ and many other editors do this
   to make it easier to distinguish different parts of the source
   code, to help prevent errors.
.. 

*Last edited: 2022-07-10 19:23:02 EDT*

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
