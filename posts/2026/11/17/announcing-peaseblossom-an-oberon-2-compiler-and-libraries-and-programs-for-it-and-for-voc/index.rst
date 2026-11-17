.. title: Announcing Peaseblossom: an Oberon-2 compiler, and libraries and programs for it and for voc
.. slug: announcing-peaseblossom-an-oberon-2-compiler-and-libraries-and-programs-for-it-and-for-voc
.. date: 2026-11-17 16:48:47 UTC-05:00
.. tags: computer,computer programming,oberon,oberon-2,vishap oberon,voc,peaseblossom oberon,poc,yaml,FLTK
.. category: computer/languages/oberon
.. link: 
.. description: 
.. type: text

This software was developed with the aid of AI.

I'm announcing a set of Oberon-2 projects: a compiler, libraries, and
programs built with them. All are on GitHub, and the software is under
the BSD 3-Clause License.

For voc (Vishap Oberon)
=======================

- olibfyaml_: a binding to libfyaml_, the YAML 1.2 parser and
  emitter. It covers parsing, navigation, typed values, building and
  emitting YAML or JSON, anchors, tags and source locations. Errors in
  the input come back as values with ``file:line:column`` messages.

For both voc and poc
====================

- opp_: the Oberon pretty printer. It reformats modules within a
  maximum line length and keeps every comment. It handles both
  compilers' language extensions. Before writing, it checks that its
  output has exactly the tokens and comments of its input.
- Ropes_: ropes, strings represented as trees of pieces, with a
  self-test and a command-line demo.
- ArgParser_: command-line parsing: long and short options,
  clustered short options, option values, commands, and usage messages.

Peaseblossom
============

- poc_, the Peaseblossom Oberon Compiler: an Oberon-2 compiler with
  an LLVM backend for Linux, FreeBSD, OpenBSD and NetBSD, and a VAX
  backend for VAX/VMS 5.5-2. It was motivated in large part by my wish
  for a more modern language than the limited ones available on the VAX
  system I maintain. A release tarball needs only clang and GNU make,
  or it can be bootstrapped using Vishap Oberon. Packages are available
  for Fedora, Debian, FreeBSD, OpenBSD and NetBSD. It comes with a
  User's Guide and a Reference Guide.
- polibfyaml_: olibfyaml for poc, with the same API, tests and
  examples.

  - ova_fmt_po_, an example program using polibfyaml: it formats
    characters for the OVA tabletop RPG from YAML as reStructuredText,
    gemtext, Markdown and more.

- pofltk_: a thick binding to FLTK_ 1.4. FLTK's classes are record
  types a program extends, and ``draw()`` and ``handle()`` are
  type-bound procedures it overrides. Coverage includes widgets, layout
  (flex and grid), menus, dialogs, text editors, browsers, trees,
  tables, images, the clipboard and preferences. ``FlTest`` drives a
  program's windows in tests on Xvfb or a headless compositor. Many of
  FLTK's test programs are ported as examples.

  - ova_cg_po_, an example program using pofltk: a character
    generator for OVA. It's a complete program with a menu bar, tabs,
    grids, file choosers, preferences and window tests. Its `tour for
    pofltk readers`_ says where in its code each technique is.

- poDateTime_: dates, times, durations and time zones. It has
  instants, the proleptic Gregorian calendar, clocks, POSIX ``TZ`` rules
  and tz database files, ISO 8601, RFC 3339 and ``strftime`` formats. It
  runs on the four Unixes and on VAX/VMS.
- pounix_: Unix services that poc's runtime doesn't provide:
  dropping root for good, file descriptors and directories, running
  child processes with an argument list (no shell), and ``errno``.
- posockets_: TCP (IPv4 and IPv6) and Unix-domain sockets. It works
  with poc's cooperative ``Tasks``, so one thread can serve many
  connections, with deadlines.
- polibtls_: a binding to libtls (LibreTLS on Linux, FreeBSD and
  NetBSD; OpenBSD's own). It supports server contexts with several key
  pairs, client certificates, and non-blocking I/O with ``Tasks``. It's
  tested against openssl, gnutls-cli and Go's TLS.
- pogemini_: a Gemini_ server built on the four libraries above. It
  serves several capsules by host name, each with its own certificate,
  and can require client certificates for parts of a capsule. Every
  connection runs in a task in one thread.
- poDB_: a database-independent SQL interface, with drivers for
  SQLite and PostgreSQL. A program moves from one to the other by
  changing its connection URL and the driver it imports.

Comments, bug reports and patches are welcome. Many of the poc
libraries are early in their lives; polibfyaml and pofltk have had the
most use.

.. _olibfyaml: https://github.com/tkurtbond/olibfyaml
.. _libfyaml: https://github.com/pantoniou/libfyaml
.. _opp: https://github.com/tkurtbond/opp
.. _Ropes: https://github.com/tkurtbond/oberon-ropes
.. _ArgParser: https://github.com/tkurtbond/oberon-argparser
.. _poc: https://github.com/tkurtbond/peaseblossom
.. _polibfyaml: https://github.com/tkurtbond/polibfyaml
.. _ova_fmt_po: https://github.com/tkurtbond/ova_fmt_po
.. _pofltk: https://github.com/tkurtbond/pofltk
.. _FLTK: https://www.fltk.org
.. _ova_cg_po: https://github.com/tkurtbond/ova_cg_po
.. _tour for pofltk readers: https://github.com/tkurtbond/ova_cg_po/blob/main/doc/pofltk-tour.md
.. _poDateTime: https://github.com/tkurtbond/poDateTime
.. _pounix: https://github.com/tkurtbond/pounix
.. _posockets: https://github.com/tkurtbond/posockets
.. _polibtls: https://github.com/tkurtbond/polibtls
.. _pogemini: https://github.com/tkurtbond/pogemini
.. _Gemini: https://geminiprotocol.net/
.. _poDB: https://github.com/tkurtbond/poDB
