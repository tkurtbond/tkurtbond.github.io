.. title: Ada Quality and Style: Guidelines for Professional Programmers
.. slug: ada-quality-and-style-guidelines-for-professional-programmers
.. date: 2024-11-22 11:49:59 UTC-05:00
.. tags: ada,style guide,ada 83
.. category: computer/languages/ada
.. link: 
.. description: 
.. type: text

.. role:: file   

The :title:`Ada Quality and Style: Guidelines for Professional
Programmers` is available on the web_, but I don't think that there is
a PDF copy anywhere easily found, so I'm making a copy available
here_.  This is the style guide for Ada 83, by the way.  I got it from
the `Ada Information Clearinghouse`_.  I downloaded the file
`style-ps.zip
<http://archive.adaic.com/docs/style-guide/83style/style-ps.zip>`_
into a temporary directory and then ran the shell script
`make-83style-pdf.sh`_ to create the PDF file:

.. _web: http://archive.adaic.com/docs/style-guide/83style/html/
.. _`Ada Information Clearinghouse`: http://archive.adaic.com/docs/style-guide/83style/
.. _here: /83style/83style.pdf
.. _`make-83style-pdf.sh`: /83style/make-83style-pdf.sh

.. include:: files/83style/make-83style-pdf.sh
   :code: bash

Then I read through the PDF and made a `bookmarks file`_ for use with
jpdfbookmarks_ (I use one of the releases from this github repo_):

.. _`bookmarks file`: /83style/83style.bookmarks
.. _jpdfbookmarks: https://sourceforge.net/projects/jpdfbookmarks/
.. _repo: https://github.com/life888888/JPdfBookmarks

.. include:: files/83style/83style.bookmarks
   :literal:

Then I ran another shell script, `build-bookmarks.sh`_:

.. _`build-bookmarks.sh`: /83style/build-bookmarks.sh

.. include:: files/83style/build-bookmarks.sh
   :code: bash

There is a PDF of the style guide for `Ada 95`_ online, but the links to the other formats listed on the `Ada 95 Documents`_ page have bit rotted, alas.

.. _`Ada 95`: https://www.adaic.org/resources/add_content/docs/95style/95style.pdf
.. _`Ada 95 Documents`: https://www.adaic.org/ada-resources/standards/ada-95-documents/
