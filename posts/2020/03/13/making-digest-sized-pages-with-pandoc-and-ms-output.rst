.. title: Making digest-sized pages with pandoc and ms output
.. slug: making-digest-sized-pages-with-pandoc-and-ms-output
.. date: 2020-03-13 14:01:10 UTC-04:00
.. tags: computer,pandoc,make,ms macros,pdfroff,text processing,groff
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command

.. note::

   After I wrote this post, I made a last minute check of the options
   to :app:`pandoc` and found that the ``--pdf-engine-opt=`` option
   does exactly what I want.  How embarrassing.  So I changed this
   post, showing both the easy way and the hard way to do it.

I use pandoc_ to produce digest-sized pages (5½×8½ inches) in PDF
documents from ReStructuredText_.  I have a :app:`ms` output template,
:file:`digest2.ms` in :file:`~/pandoc/templates` that sets the page
width and page height correctly.  Unfortunately, there is no way to
set the papersize properly in the template. [#heirloomtroff]_

Luckily, :app:`pandoc` has the ``--pdf-engine-opt=`` option to pass
options to the PDF engine that :app:`pandoc` is using.  In the case of
:app:`ms` output the thing to do is pass the argument
``--pdf-engine-opt=-P-p8.5i,5.5i`` [#recursively]_, like below.

.. listing:: GNUmakefile.pandoc-digest-pdf-engine-opt make

Unfortunately when I originally had this need for digest pages I
hadn't realized that the ``--pdf-engine-opt=`` option existed.

So I used ``pandoc --verbose`` and found the :app:`pdfroff` invocation
:app:`pandoc` uses, and made my :app:`pandoc` invocation output
:app:`ms` instead of PDF, then passed it through a :app:`pdfroff`
command with the added ``-P-p8.5i,5.5i`` argument.  Here's what I put
in my :file:`GNUmakefile`:

.. listing:: GNUmakefile.pandoc-digest-save-ms make

Or, if you don't care about having the :app:`ms` output for debugging,
you could do it as a pipeline:

.. listing:: GNUmakefile.pandoc-digest-pipeline make

There are still some instances where this technique of having
:app:`pandoc` output the :app:`ms` source directly and pass it through
:app:`pdfroff` yourself.  For instance, if you have to do some
massaging of the :app:`ms` source, like changing ``.RS/.RE`` to
``.QS/.QE`` to get around the problem with block quotes in :app:`ms`
output in the current :app:`pandoc` release, discussed here_.

.. [#heirloomtroff] Heirloom Troff (originally at H1_, but now *I
   think* more up to date at H2_ and H3_) has the ``.mediasize`` and
   ``.papersize`` commands for that.

.. [#recursively] Amusingly, :app:`pandoc` passes the
   ``--pdf-engine-opt=-P-p8.5i,5.5i`` argument to :app:`pdfroff`,
   which passes the ``-P-p8.5i,5.5i`` part to :app:`groff`, which
   passes the ``-p8.5i,5.5i`` part to the (final) post processor — I'm
   not sure if *that* is :app:`grops` or :app:`gropdf`.

.. _pandoc: https://pandoc.org/
.. _ReStructuredText: https://en.wikipedia.org/wiki/ReStructuredText
.. _H1: http://heirloom.sourceforge.net/doctools.html
.. _H2: http://n-t-roff.github.io/heirloom/doctools.html
.. _H3: https://github.com/n-t-roff/heirloom-doctools
.. _here: link://slug/pandoc-discuss-post-can-the-rsre-macros-in-ms-output-be-replaced-with-qsqe
