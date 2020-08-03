.. title: Colophon
.. slug: colophon
.. date: 2019-11-06 12:02:03 UTC-05:00
.. tags: website dtd,dsssl,docbook,xml,sgml,xsl
.. category: blog
.. link: 
.. description: 
.. type: text

.. role:: program

.. _colophon:

Colophon
========

(Formerly “About TKB's Home Page”.)

The Really Distant Past
-----------------------

I used to build this collection of pages largely from a single
SGML/XML document (expressed as several separate files) using `Jade
<http://www.jclark.com/jade/>`__ and `Norm Walsh
<http://nwalsh.com/>`__'s `Website DTD <http://nwalsh.com/website/>`__
and his `Website Stylesheet <http://nwalsh.com/website/dsssl/>`__, a
customization of the DSSSL `DocBook Stylesheet
<http://nwalsh.com/docbook/dsssl/>`__ for HTML.  (Alas, the specific
links above have vanished from the Web, not to be resurrected by `The
Internet Archive`_) There were a few links to legacy HTML pages.

.. _`The Internet Archive`: http://archive.org

I liked building these pages from XML using DSSSL for a number of
reasons:

#. It ensured that all the internal links are correct.
#. It automatically built navigation tools and a site map.
#. It was a good excuse to use XML & DSSSL.

I used DSSSL long after the DSSSL stylesheets for the Website DTDs
were no longer maintained because the build process was considerably
simpler than that of the XML/XSLT replacement.  Unfortunately, the
setup I was using stopped working properly when I moved from FreeBSD
4.11 to FreeBSD 6.2 (so probably in 2007), and at the time I didn't
have the patience to figure out what had gone wrong with the variety
of FreeBSD pacakges I was using to build the site.

I had a primitive sort-of blog that was part of the site, which I made
by just having SGML/XML pages in a log directory, named by YYYY-MM-DD.

The Distant Past (??? to 2007-07-31?)
-------------------------------------

Reluctantly I turned to the currently supported Website DTD and XSL
stylesheets, along with the DocBook DTD and XSL stylesheets they build
upon, along with an XSL processor, :program:`xsltproc`.  There had
been a number of changes to the DTD, which required many changes to my
website XML files.  Most annoying was that at some point during the
development of the XSL stylesheets for the Website DTD the
organization as a single XML document had been abandoned, and replaced
by a multiple document model that required processing each XML file
separately and maintaining a separate multiple-document database of
linking information.  This meant that instead of including my entities
once in the original master file I had to include them in each and
every XML file.  This also meant that all the internal links I had
used previously had to be replaced with interdocument links using
olink .  Unfortunately, I found that FreeBSD's ports of the Website
DTD and XSL stylesheets and the DocBook XSL Stylesheets were each a
revision behind, which caused linking between documents to not work.
After downloading and installing current copies of these I finally got
things to work.

Alas, I found that, at least using :program:`xsltproc`, the
new process using XSL was *much* slower and more resource intensive:
the old DSSSL-based process took about 2.5 minutes and never exceed 40
megabytes of resident memory, while the new XSL-based process took 20
minutes (on a faster machine) and used 70 or more megabytes of
resident memory for each file, and during processing the interdocument
link database reaches over 300 megabytes of resident storage.
Admittedly, some of this was due to the change in the Website DTD from
the one document model to the multiple document model, but still it
seemed excessive.

.. _sphinx-built:

The Past (2009-04-17 to 2015?)
------------------------------

Eventually I moved the source for my website over to
`ReStructuredText`_ (ReST) built using Sphinx_ It was much simpler
than DocBook.  I missed the more structured DocBook approach, and the
checking of cross-references, but ReST had enough structure to be
useful, without having an complicated syntax, and the tools used to
process it were considerably simpler, faster, and more approachable.
I just wish ReST had nested interpreted text roles and easier
subscripts and superscripts.  I actually used Sphinx to build the
website, as you could see at the bottom of each page of this version.
I was very happy with how simple it was to maintain.

.. _ReStructuredText: http://docutils.sourceforge.io/rst.html
.. _Sphinx: http://www.sphinx-doc.org/

I also had a pyBloxsom_ blog, writing the posts in reStructuredText,
too, with a link to the blog on the front page of my website.

.. _pyBloxsom: https://pyblosxom.github.io/

Eventually, the computer that I used to host my web site and blog went
away, and I didn't have a web site and blog for several years.


The Present (2019-11-06 onward)
--------------------------------

I've :doc:`switched <converting-my-pybloxsom-blog-into-a-nikola-blog>`
over to using Nikola_ to generate the site and blog, and hosted it at
`GitHub <https://tkurtbond.github.io>`__.  I wrote a script to convert
my pybloxsom blog ``*.rst`` files to the format that Nikola uses,
which took a couple hours though the script ended up fairly short, and
then spent much more time manually fixing broken internal links. 😀 I
converted some of the web pages from my website over to static pages
on the new Nikola-built blog.

Nikola has much more functionality than I'm currently using, but it
has some nice clean themes and they are simple enough that I can make
simple changes to them.  I'm enjoying blogging again.

.. _Nikola: https://getnikola.com/

*Last edited: 2020-08-03 15:57:13 EDT*

..
   Local Variables:
   time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
