.. title: Sorting differs between LANG=C and LANG=en_US.UTF-8, even in ls
.. slug: sorting-differs-between-langc-and-langen_usutf-8-even-in-ls
.. date: 2021-07-28 05:05:50 UTC-04:00
.. tags: LANG=en_US.UTF-8,LANG=C,sorting,sort
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: command

This is here mostly to give me a concrete example of this happening.

I have a directory, with two files in it, :file:`ab.txt` and
:file:`a-c.txt`.  Which sorts first when I do a :command:`ls`?  It
depends on what locale is set.  Like this:

.. code:: bash

   $ LANG=en_US.UTF-8 ls
   ab.txt	a-c.txt
   $ LANG=C ls
   a-c.txt  ab.txt

Same thing happens with the :command:`sort` command:

.. code:: bash

   $ cat >a-c-first.txt
   a-c.txt
   ab.txt
   $ cat >ab-first.txt
   ab.txt
   a-c.txt
   $ LANG=C sort ab-first.txt 
   a-c.txt
   ab.txt
   $ LANG=en_US.UTF-8 sort a-c-first.txt 
   ab.txt
   a-c.txt

I found this surprising when it first broke some code I was using,
since I'd spent so much of my existence in LANG=C (I'm still surprised
that Unicode has existed for more than half my life), but once I set
LANG=en_US.UTF-8 because I was using UTF-8 characters in my documents
I found I was in a different (sorting) world.
