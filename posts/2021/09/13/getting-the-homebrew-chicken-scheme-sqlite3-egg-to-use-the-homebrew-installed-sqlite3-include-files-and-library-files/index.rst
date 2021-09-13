.. title: Getting the homebrew CHICKEN Scheme sqlite3 egg to use the homebrew-installed sqlite3 include files and library files
.. slug: getting-the-homebrew-chicken-scheme-sqlite3-egg-to-use-the-homebrew-installed-sqlite3-include-files-and-library-files
.. date: 2021-09-13 16:59:50 UTC-04:00
.. tags: chicken scheme,csc,chicken-install,scheme
.. category: computer/languages/lisp/scheme/chicken-scheme
.. link: 
.. description: 
.. type: text

To get the Homebrew_ installed `CHICKEN Scheme`_ (HBCHICKEN_) to use
the Homebrew_ installed version of sqlite3_ (HBSQLITE3_) — because the
one supplied by Apple in macOS is obsolete — for the `sqlite egg`_,
you need to set ``CSC_OPTIONS`` properly:

.. code:: bash
   
   $ export CSC_OPTIONS="-I/usr/local/Cellar/sqlite/3.36.0/include -L/usr/local/Cellar/sqlite/3.36.0/lib"
   $ chicken-install sqlite3
   building sqlite3
      /usr/local/Cellar/chicken/5.2.0/bin/csc -host -D compiling-extension -J -s -regenerate-import-libraries -setup-mode -I /Users/tkb/.cache/chicken-install/sqlite3 -C -I/Users/tkb/.cache/chicken-install/sqlite3 -O2 -d1 -L -lsqlite3 sqlite3.scm -o /Users/tkb/.cache/chicken-install/sqlite3/sqlite3.so
      /usr/local/Cellar/chicken/5.2.0/bin/csc -regenerate-import-libraries -M -setup-mode -static -I /Users/tkb/.cache/chicken-install/sqlite3 -emit-link-file /Users/tkb/.cache/chicken-install/sqlite3/sqlite3.link -host -D compiling-extension -c -unit sqlite3 -D compiling-static-extension -C -I/Users/tkb/.cache/chicken-install/sqlite3 -O2 -d1 sqlite3.scm -o /Users/tkb/.cache/chicken-install/sqlite3/sqlite3.static.o
      /usr/local/Cellar/chicken/5.2.0/bin/csc -setup-mode -s -host -I /Users/tkb/.cache/chicken-install/sqlite3 -C -I/Users/tkb/.cache/chicken-install/sqlite3 -O2 -d0 -L -lsqlite3 sqlite3.import.scm -o /Users/tkb/.cache/chicken-install/sqlite3/sqlite3.import.so
   installing sqlite3

You'll probably need to adjust the version numbers in the pathnames
for whatever version is installed on your computer.

.. _homebrew: https://brew.sh/
.. _CHICKEN Scheme: http://call-cc.org
.. _HBCHICKEN: https://formulae.brew.sh/formula/chicken
.. _sqlite3: https://www.sqlite.org/
.. _HBSQLITE3: https://formulae.brew.sh/formula/sqlite
.. _sqlite egg: http://wiki.call-cc.org/eggref/5/sqlite3

