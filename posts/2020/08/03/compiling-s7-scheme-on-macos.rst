.. title: Compiling s7 scheme on macOS
.. slug: compiling-s7-scheme-on-macos
.. date: 2020-08-03 14:17:15 UTC-04:00
.. tags: s7,scheme,macsOS,ld
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command

To compile `s7 scheme`_ with a standalone REPL_, s7's home page says to
add the empty file :file:`mus-config.h` to the source directory, then
(in Linux):

.. code:: bash

   gcc s7.c -o repl -DWITH_MAIN -I. -O2 -g -ldl -lm -Wl,-export-dynamic

It turns out that on macOS, whose :command:`ld` (from clang) doesn't
understand ``-export-dynamic``, you have to do

.. code:: bash

   gcc s7.c -o repl -DWITH_MAIN -I. -O2 -g -ldl -lm -Wl,-dynamic

Then you need to do

.. code:: bash

   ./repl libc.scm

which seems to generate :file:`libc_s7.c` and compile it into
:file:`libc_s.so`.   Then you can run the REPL_:

.. code:: bash

   ./repl

which, from looking at :file:`s7.c`, loads :file:`repl.scm`.
Unfortunately, I don't understand the repl commands, except for
``pwd`` and ``cd``.  Oh, and ``(exit)`` exits the repl.

.. _s7 scheme: https://ccrma.stanford.edu/software/snd/snd/s7.html
.. _REPL: link://slug/computer-vocabulary#REPL

*Last edited: 2020-08-03 16:03:57 EDT*

..
   Local Variables:
   time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:

