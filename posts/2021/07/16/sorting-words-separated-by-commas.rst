.. title: Sorting words separated by commas
.. slug: sorting-words-separated-by-commas
.. date: 2021-07-16 13:05:09 UTC-04:00
.. tags: shell,bash,emacs,script
.. category: computer/shell
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: command
.. role:: file
.. role:: key

I often have lists of "words", separated by commas, possibly on
multiple lines, like this example from a :file:`Makefile`:

.. code:: makefile

   #    bookman, schoolbook, palatino, times,
   #    helvetica, helvetica-narrow, optima, cormorant-garamond,
   #    or ebgaramond.

I find these lists are always getting out of order, or they end up
with some short lines and some long lines.  I want to be able to
reformat them automatically, like this:

.. code:: makefile

   #    bookman, cormorant-garamond, ebgaramond, helvetica, helvetica-narrow,
   #    optima, palatino, schoolbook, or times.


So, I wrote three scripts to deal with them,
:command:`sort-with-commas`, :command:`strip-leading-hash` to get rid
of the leading hashes and spaces, and :command:`prefix` to put the
leading hashes and spaces back.

Now, above I said "words", because really it's anything separated by
commas, so the "words" can contain space, etc.

Also, notice that the period after "ebgaramond" and the "or" before
"ebgaramond"` in the original list disappear, and an "or " appears
before the new end of the list, "times", and a period follows it.  And
you can have have the same situation with "and".  So, the ``-p``
option to :command:`sort-with-commas` adds a period after the last
word, the ``-a`` option adds and "and " before the last word, and the
``-o`` option adds an "or " before the last word.  If you are sorting
only part of a list, you want to have a comma after the last "word",
so there is the option ``-f`` for that.  And to remove the the period
from the original list, so it doesn't end up in the middle of the new
list, or to remove "and " or "or ", there is the ``-r`` option.

The default is to return the sorted list as one long line, but you can
easily reformat it to multiple lines by running it through the Unix
command :command:`fmt`.

Although in this case the list is prefixed with a "#" and some spaces
because it comes from a comment in a Makefile, you have to remove
those to sort the list.  I wrote the script
:command:`strip-leading-hash` to do that, too, rather than having to
remember the :command:`sed` command to so that all the time.

So, to sort the original list I'd run the command

.. code:: bash

   strip-leading-hash | sort-with-commas -r -p -o | fmt | prefix "#    "

which means “strip the leading hashes and spaces, remove the trailing
period and the "and " or "or ", add a final period after the last word,
add an "or " before the final word, reformat as a paragraph, and
prefix the lines with the hash and spaces.”

When I use this I'm usually in :app:`emacs` and using :key:`M-|` to
run it on the region (the currently selected text), often with the
:key:`C-u` to replace the region with results.


Here's the main script, :file:`sort-with-commas`:

.. listing:: sort-with-commas bash

Here's :file:`strip-leading-hash`:

.. listing:: strip-leading-hash bash

And here's :file:`prefix`:

.. listing:: prefix bash
