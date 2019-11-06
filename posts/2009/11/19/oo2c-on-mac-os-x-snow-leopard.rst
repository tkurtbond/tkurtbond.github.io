.. title: oo2c on Mac OS X Snow Leopard
.. slug: oo2c-on-mac-os-x-snow-leopard
.. date: 2009-11-19 12:18:03 UTC-05:00
.. tags: mac os x,oberon
.. category: computer/MacOSX
.. link: 
.. description: 
.. type: text


.. role:: program

It looks like I got oo2c_ to build and work under Mac OS X Snow
Leopard, with some stupid hacks, at least enough for my purposes.  I
don't claim that this is suitable for production work.

Here's the :program:`configure` invocation I used::

    CFLAGS='-no-cpp-precomp -fnested-functions -I/opt/local/include' \
    LDFLAGS='-L/opt/local/lib' \
        ./configure --prefix=/sw/versions/m64/oo2c/2.1.11 --disable-libs


Here's the patch_.

.. _oo2c: http://sourceforge.net/projects/ooc
.. _patch: /oo2c-macosx-snow-leopard.patch
