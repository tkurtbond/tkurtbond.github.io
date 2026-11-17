.. title: Announcing oo2c 2.2.4: a revived fork of the Optimizing Oberon-2 Compiler
.. slug: announcing-oo2c-224-a-revived-fork-of-the-optimizing-oberon-2-compiler
.. date: 2026-11-17 18:11:11 UTC-05:00
.. tags: oberon,oberon-2,oo2c,fork,linux,fedora,ubuntu,freebsd,openbsd,netbsd,32 bit,64 bit
.. category: 
.. link: 
.. description: 
.. type: text

This software was developed with the aid of AI.

oo2c_ is the Optimizing Oberon-2 Compiler from the OOC project: an
Oberon-2 to C translator with an optimizer built on GSA (guarded
single-assignment form), a large standard library, and tools such as
the ``oocdoc`` documentation generator. Its development stopped with
release 2.1.11 in 2011, and that release no longer builds on current
systems.

My fork brings it back. Version 2.2.4 builds, runs and passes its tests
on:

- Linux with current gcc and Boehm gc: Fedora 44 and 45 and Ubuntu
  26.04, on x86-64, aarch64 and i386;
- FreeBSD 15.1 (x86-64 and aarch64);
- OpenBSD 7.9 and NetBSD 11.0, both 64-bit (amd64) and 32-bit (i386),
  and NetBSD 11.1.

GitHub's CI builds, self-hosts and tests it on Linux and in FreeBSD,
OpenBSD and NetBSD virtual machines. A release tarball bootstraps with
no oo2c installed: ``./configure && make && make install``. There is
``oo2c_64`` for 64-bit systems and ``oo2c_32`` for 32-bit ones, signed,
with SHA-256 sums.

What changed since 2.1.11
=========================

- **The language.** Using a nested procedure as a procedure value is
  now an error, as the Oberon-2 report requires; the generated C would
  have needed an executable stack. Programs that did this must be
  changed. A ``POINTER [CSTRING] TO ARRAY OF CHAR`` no longer allows
  ``LEN(p^)``, which read memory before the string.
- **The generated C** compiles with gcc 16 with no warnings, and the
  compiler and library build with no warnings.
- **Checking.** ``make test-valgrind`` and ``make test-asan`` run the
  test programs under valgrind, and under AddressSanitizer and
  UndefinedBehaviorSanitizer. Undefined behaviour they found in
  ``ASH``, ``SYSTEM.ROT``, empty open arrays and the hash functions is
  fixed.
- **Threads** (``--enable-threads=pthreads``) work on Linux and the
  three BSDs.
- **The build** works with autoconf 2.72 and libtool 2.5, and ``make
  dist`` and ``make dist32`` work again.

NEWS_ lists every change, release by release, and INSTALL_ the
packages and ``configure`` settings for each system.

oo2c is licensed as upstream: the compiler under the GNU GPL version 2,
the library under the GNU LGPL.

oo2c sits beside my own Oberon-2 compiler, Peaseblossom_, which I
announced earlier today.

Releases, bug reports and the source are on GitHub_. Comments, bug
reports and patches are welcome.

.. _oo2c: https://github.com/tkurtbond/oo2c
.. _NEWS: https://github.com/tkurtbond/oo2c/blob/master/NEWS
.. _INSTALL: https://github.com/tkurtbond/oo2c/blob/master/INSTALL
.. _Peaseblossom: https://github.com/tkurtbond/peaseblossom
.. _GitHub: https://github.com/tkurtbond/oo2c/releases

