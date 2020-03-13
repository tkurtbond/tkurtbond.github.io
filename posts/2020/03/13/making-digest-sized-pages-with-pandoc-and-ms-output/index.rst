.. title: Making digest-sized pages with pandoc and ms output
.. slug: making-digest-sized-pages-with-pandoc-and-ms-output
.. date: 2020-03-13 14:01:10 UTC-04:00
.. tags: computer,pandoc,make,ms macros,pdfroff
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command

I use pandoc_ to produce digest-sized pages in PDF documents
from ReStructuredText_.  I have a :app:`ms` output template,
:file:`digest2.ms` in :file:`~/pandoc/templates` that sets the page
width and page height correctly.  Unfortunately there isn't an way to
set the paper size in the template.  To do that you have to pass
the -P option to :app:`pdfroff`, which passes its argument to the
post-processor.  :app:`pandoc` doesn't have a way to pass options to
:app:`pdfroff`.  So I used ``pandoc --verbose`` and found the
:app:`pdfroff` invocation :app:`pandoc` uses.  Here's what I put in my
:file:`GNUmakefile`:

.. listing:: GNUmakefile.pandoc-digest-save-ms make

Or, if you don't care about having the :app:`ms` output for debugging,
you could do it as a pipeline:

.. listing:: GNUmakefile.pandoc-digest-pipeline make

.. _pandoc: https://pandoc.org/
.. _ReStructuredText: https://en.wikipedia.org/wiki/ReStructuredText
