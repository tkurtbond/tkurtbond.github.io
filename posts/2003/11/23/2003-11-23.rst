.. title: Markup Languages
.. slug: 2003-11-23
.. date: 2003-11-23 00:00:00 UTC-05:00
.. tags: old blog,markup languages
.. category: oldblog
.. link: 
.. description: 
.. type: text


.. role:: app

I've always had an interest in markup and document formatting
languages, and have long used :app:`troff` and :app:`LaTeX`
for document formatting and XML and `DocBook
<http://www.docbook.org/>`__ for markup, using the DSSSL DocBook
Stylesheets and `OpenJade <http://openjade.sourceforge.net/>`__ along
with :app:`JadeTeX` to produce HTML and PDF output.  I've also used a
homebrewed application that produced Postscript output from Simplified
DocBook using `Groff
<http://www.gnu.org/software/groff/groff.html>`__.

Unfortunately, I've not been particularly satisfied with the results.
Many of the tools involved are complicated to set up, some are
suffering from a lack of manpower for maintenance, and often it is
very difficult to customize the appearance of the generate output.
Groff is perhaps the simpliest to install, but I've no desire to write
in bare troff any more than I have in bare :app:`LaTeX`, and :app:`groff` and its
macro packages lack good support for PDF - in particular, pdfmarks.
LaTeX has good support for PDF (especially when you are using
:app:`pdfelatex`), but it is difficult to customize the appearance of the
output, and there are a number of quirks when it comes to font
handling.  [1]_ And the PDF output from the DSSSL DocBook Stylesheets
[2]_ can be very ugly when you are doing complicated things, and since
it uses :app:`JadeTeX` it's even harder to customize the appearance of the
output than LaTeX .

While I've not found any general solution for the problem, I've have
run across something that looks promising: `ConTeXt <http://www
.pragma-ade.com>`__.  It is a TeX macro package that provides about the
same level of structural markup as LaTeX but appears to be much more
customizable.  [3]_ It also has very good support for interactive
documents, reasonably good manuals, and appears to have significant
development resources behind it.  I think it would make a more suitable
backend than :app:`LaTeX`.  [4]_

As for those documents where XML markup is too much of a pain (say,
things that should be easy to read as plain text, where the verbosity
of XML tags overwhelms the text), I've found that the
`reStructuredText <http://docutils.sourceforge.io/rst.html>`__ (part
of the `Docutils <http://docutils.sourceforge.io/>`__ project) fits
the bill nicely.  Every since `Steffan O'Sullivan
<http://www.panix.com/~sos/>`__ produced the `Fudge
<http://www.panix.com/~sos/fudge.html>`__ RPG in plain text format
I've been looking for an easy way to turn something that looks like
plain text into reasonably nicely formatted output.  reStructuredText
fits that bill nicely.  It has enough structure to be useful without
overloading the plain text with markup, it produces good looking
output, and it's reasonably easy to process, with a DTD, an XML form,
and an extensible implementation that's not too difficult to program.
For things that I would otherwise be writing in plain text I'll be
using reStructuredText from here on out, and I'm writing an
reStructuredText to ConTeXt writer as I have time.

WYSIWYG? Well, that's a nice idea, but I've yet to find a system that
works well for anything but the simpliest documents.  I'd like to find
a portable, open source WYSIWYG XML editor that supports DocBook, but
they seem in short supply.




.. [1] In particular, it's very annoying to have the ligatures disappear
   from printed output when using the standard Postscript fonts because
   Adobe Acrobat 's printer driver mishandles them.

.. [2] I've not tried the XSL DocBook Stylesheets because in some ways
   the toolchain involved is even more complicated than for the DSSSL
   DocBook Stylesheets toolchain.

.. [3] In some ways it reminds me of `Victor Eijkhout
   <http://www.eijkhout.net/>`__'s TeX macro package `Lollipop
   <http://www.tug.org/TUGboat/Articles/tb13-3/eijkhout.pdf>`__, though
   more complete.

.. [4] Doesn't that mean I'll be using :app:`TeX`, which is rather complicated
   to install and use? Well, yes.  However, there are easy-to-use
   distributions of TeX that include ConTeXt for the Unix distributions
   that I use as well as for MS Windows
   (`teTeX <http://www.gug.org/tetex/>`__, for instance).
