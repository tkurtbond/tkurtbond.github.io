.. title: Website Construction
.. slug: website-construction
.. date: 2008-07-07 20:12:17 UTC-05:00
.. tags: website
.. category: computer
.. link: 
.. description: 
.. type: text


I've been using the DocBook Website customization to build my website
since the beginning.  

First I used the DSSSL stylesheets to built it.  They built the
website as a single SGML (and later XML) document from multiple input
files included into a main organizing file that produced multiple HTML
output files, checking all the cross references and building a site
map.  Unfortunately, this method stopped working in my environment for
some reason, and I never had time to figure out why.

I thought I'd see how the XSL stylesheets the DocBook Website
customization worked.  The architecture for the Website customization
changed between the two: now the website was multiple documents, each
built from an XML input file and producing an HTML output file, and
using the DocBook XSL stylesheet ``olink`` cross-document linking for
links between the different pages.  This necessitated changing all the
source files, but even more unfortunately the processing of cross
document links consumed so much memory that rebuilding the site took
forever, and eventually got to the point where it used more memory
than was usually available on my server.  (Admittedly, my setup was
atypical for DocBook, and perhaps even pathological.)

In disgust, I let my site lie fallow, waiting for some better solution
to present itself. Alas, nothing was immediately forthcoming.  I
really like DocBook for markup, and the “correct” solution would
probably be to take `Norm Walsh`_'s route_ and custom-build some DocBook
to website software, but frankly I haven't had the time or energy to
do that, especially since, if I follow Norm's example_, I'd have to
take the time to figure out RDF and so forth.

.. _`Norm Walsh`: http://norman.walsh.name
.. _route: http://norman.walsh.name/2003/05/14/how
.. _example: http://norman.walsh.name/2003/06/16/build

Eventually I decided that I'd try something minimal: adding a new
blog_ using pyBloxsom_, which seemed simple enough to be
comprehendable.  It supported reStructuredText_, one of the nicer
plaintext_ markup systems, which was a definite bonus [#simple]_.
After fiddling around about I got enough for a reasonably comfortable
minimalist blog.  So, give it a look-see.

.. _blog: https://tkurtbond.github.io
.. _pybloxsom: http://pybloxsom.sourceforge.net
.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _plaintext: link://slug/plain-text-markup

.. [#simple] I hate most WYSIWYG software, and am hoping that using
   reST regularly for the blog will be lightweight enough that I won't
   notice the burden.
