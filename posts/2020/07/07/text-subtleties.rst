.. title: Text Subtleties
.. slug: text-subtleties
.. date: 2020-07-07 19:05:13 UTC-04:00
.. tags: text,unicode,utf-8,groff,heirloom troff,xelatex,context
.. category: computer
.. link:
.. description:
.. type: text

.. role:: app
.. role:: file
.. role:: command

*Last edited: 2020-07-08 04:51:20 EDT*

I just noticed that when wget_ tells you the filename of file it just
saved, if your ``LANG=C`` then it surrounds it with apostrophes ('), but
if your ``LANG=en_US.UTF-8`` then it surrounds it with Unicode_ LEFT SINGLE
QUOTATION MARK (‘)and RIGHT SINGLE QUOTATION MARK (’).  I appreciate
little subtleties like that.

.. _wget: https://www.gnu.org/software/wget/
.. _Unicode: https://en.wikipedia.org/wiki/Unicode

I use Unicode characters in most of the writing I do.  For LaTeX_,
which I rarely use these days, I use XeTeX_, which understands UTF-8
natively.  ConTeXt_, which I do use regularly, also understands UTF-8
natively.  For groff_ I use the ``-k`` switch, which preprocesses the
text with :command:`preconv` (which is part of groff_), converting the
UTF-8 characters into groff_ character escapes, since groff_ *doesn't*
understand UTF-8 natively.  Of course, if it is ReStructuredText_ that
I'm working with then pandoc_ can be configured to use any one of
LaTeX_, ConTeXt_, and groff_ for creating PDF output, and since
:command:`rst2html.py` just produces LaTeX_ that includes any
character you put in your source you can just use :command:`xelatex`
as part of your commands to turn it into PDF.  And sometimes, when I'm
feeling whimsical, I use :app:`Heirloom Troff`, from the `Heirloom
Documentation Tools`__, which understands UTF-8 natively.

.. _LaTeX: https://en.wikipedia.org/wiki/LaTeX
.. _XeTeX: https://en.wikipedia.org/wiki/XeTeX
.. _ConTeXt: https://en.wikipedia.org/wiki/ConTeXt
.. _groff: https://www.gnu.org/software/groff/
.. _ReStructuredText: https://docutils.sourceforge.io/rst.html
.. _pandoc: https://pandoc.org/
__ https://n-t-roff.github.io/heirloom/doctools.html

..
   Local Variables:
   time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   End:
