.. title: Converting my old log entries to blog entries
.. slug: convert-my-old-log-entries-to-blog-entries
.. date: 2014-11-04 00:31:38 UTC-05:00
.. tags: old blog
.. category: oldblog
.. link: 
.. description: 
.. type: text


I converted my old log entries, which originated from my original
Docbook-based website, and were presently part of my static
Sphinx-based website, over to my current PyBlosxom blog tonight,
using the following script:

.. code::

   #! /usr/bin/env bash
   find 200? -type f ! -name \*~ ! -name \*-idx-*.rst |
   while read filename
   do
       newname="$(echo $filename | sed 's#/#-#g')"
       date="$(basename $newname .rst)"
       (echo $date; echo "#published $date 00:00:00"; echo "#tags Old Blog";
	   cat $filename) >/home/tkb/myblog/entries/oldblog/$newname 
   done

I'll have to go through and fix uses of Sphinx-specific RST
extensions, and I'll probably add real entry titles as I do so; in the
meanwhile, if the blog entry title is a date I haven't updated the
entry.  I think this was pretty good for a ½ hour's work.
