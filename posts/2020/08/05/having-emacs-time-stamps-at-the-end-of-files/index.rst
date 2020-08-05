.. title: Having Emacs time-stamps at the end of files
.. slug: having-emacs-time-stamps-at-the-end-of-files
.. date: 2020-08-05 16:34:22 UTC-04:00
.. tags: emacs,time-stamp
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: key
.. role:: app

Do you ever use :app:`Emacs` time stamp functionality (type :key:`C-h
f time-stamp` in :app:`Emacs` to learn about that) to insert the
current date time stamp into your file when you save it?  I use this
frequently in documents I write, for my blog or standalone.  For the
longest time I thought you had to have the time stamp at the beginning
of the file.  But I wanted it at the end of blog posts because it’s
really an afterthought to most readers.  (Sometimes I go back and edit
posts some time after first posting them — perhaps they were
incomplete, or they had errors that needed correcting, etc.)  It turns
out that you can do that — if you set the variable
:code:`time-stamp-line-limit` to a negative number it will look
backwards from the end of the file for the timestamp.  I often set the
time stamp variables in a ``Local Variables:`` comment at the end of
the file.

Here's the reST_ fragment I insert into my blog posts that uses
:code:`time-stamp`:

.. _reST: https://docutils.sourceforge.io/rst.html

.. code:: ReST

   .. role:: app
   .. role:: file
   .. role:: command
   .. role:: key

   .. *Last edited: 2020-08-05 17:03:37 EDT*

   ..
      Local Variables:
      time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
      time-stamp-start: "Last edited:[ \t]+\\\\?"
      time-stamp-end: "\\*\\\\?\n"
      time-stamp-line-limit: -20
      End:
