.. title: Plain Text Markup
.. slug: plain-text-markup
.. date: 2008-07-08 17:39:48 UTC-05:00
.. tags: asciidoc,restructuredtext,plain text,markup
.. category: computer
.. link: 
.. description: 
.. type: text


.. Note:: This is unfinished.

I still like plain text.  Almost *none* of the e-mail that I get that
uses HTML formatting actually gains anything from the additional
complexity.

Most of my writing doesn't require a 200 mebibyte word processor
installation that still can't do reasonable *intra*-document linking,
much less *inter*-document linking.  Moreover, whenever I have to use
such a beast, the conceptual overhead always gets in the way.  I
realize these may just be my own quirks, but they really make a
difference to me.

So, I like to do my writing in plain (or very nearly plain) text.  But
I also like having nicely printed documents, plus some hope of being
able to move from the plain text documents to something more
sophisticated on those occasions where it is warranted.  So, what do I
do?

I use AsciiDoc_ and reStructuredText_ (aka ReST) for writing.  

Why both?  Well, they both have pluses and minuses.

reStructuredText
================

Pros: I found reStructuredText first.  It looks pretty good as plain
text, and produces clean HTML and PDF.  It can handle deeper
structures off the bat than AsciiDoc, which is occasionally important
to me.  (Some document formats require absurdly deep levels of nested
sections.)  It can be turned into PDF using LaTeX fairly easily.

Cons: some of the systems I use regularly don't have good packages for
docutils_, the underlying toolset.  This may be in part because
although docutils has a long history and is pretty solid, it's still
not considered version 1.0 material.  I get the surface impression
that there are still some things that the developers are thinking
about.  And there isn't a supported DocBook_ output format.  That's a
real shame.


AsciiDoc
========

Pros: AsciiDoc, just like reStructuredText, can go straight to HTML.
And AsciiDoc's HTML looks nicer straight out of the box.

AsciiDoc is also explicitly a plain-text encoding of DocBook.  This
lets you be sure you can convert it to something widely used and well
understood, which can then be converted by well-known tools into
various other formats including PDF and HTML.

It has better package support amongst the environments I use.

Cons: not as pretty looking in source form as reStructuredText.

Conclusions
===========

I wish it was easier to add special purpose structure to both AsciiDoc
and reStructuredText that can easily added to all the output formats,
for special purpose things like RPG stats or other complicated
technical documentation.

So, what do I do when I need something more sophisticated?  Use
DocBook_, of course.



.. _AsciiDoc: http://www.methods.co.nz/asciidoc/
.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _docutils: http://docutils.sourceforge.net/
.. _DocBook: link://slug/docbook
