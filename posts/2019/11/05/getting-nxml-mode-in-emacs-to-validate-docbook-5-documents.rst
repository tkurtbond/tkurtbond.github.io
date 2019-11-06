.. title: Getting nxml-mode in emacs to validate DocBook 5 documents
.. slug: getting-nxml-mode-in-emacs-to-validate-docbook-5-documents
.. date: 2019-11-05 20:32:24 UTC-05:00
.. tags: DocBook 5,Emacs,Fedora,macOS
.. category: computers
.. link: 
.. description: 
.. type: text

I have occasion to edit and build a DocBook 5 document under both
macOS Catalina and Fedora 30.

On macOS I've used homebrew to install the docbook, docbook-xsl, and
libxslt (for xsltproc), and fop formulas, and changed my PATH to
include the directory where brew installed ``xsltproc``. which will then
use ``/usr/local/etc/xml/catalog`` to find files, in which brew installed
links to the docbook schemas and xsl stylesheets.

On Fedora I've used dnf to install the docbook5-schemas,
docbook5-style-xsl, and fop packages.

The document builds fine on both OSes, but Emacs doesn't validate
properly against the DocBook RELAX NG schemas, because the ``*.rnc`` files
supplied with Emacs (26.3 on macOS, 26.2 on Fedora) are for DocBook 4.
However, Emacs will look at a schemas.xml file in the same directory
as the file you are editing to find the ``*.rnc`` files.  Unfortunately,
of course, they have different locations on macOS with brew and on
Fedora.

So I wrote a script, generate-schemas-xml, in bash using xmlcatalog to
look up the translation for the URI for the RELAX NG compiled schema
file and generate the schemas.xml file and substitute the translation
into the file:

.. listing:: generate-schemas-xml bash

Then I had my Makefile generate the schemas.xml file if it was missing.

It was more complicated that I'd have liked, but it does work.
