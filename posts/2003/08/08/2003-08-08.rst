.. title: This Weblog
.. slug: 2003-08-08
.. date: 2003-08-08 00:00:00 UTC-05:00
.. tags: old blog
.. category: oldblog
.. link: 
.. description: 
.. type: text


I've added crude previous and next links to these weblog pages.

The process of creating this weblog is very crude by current
standards.  Each of these weblog pages starts out as a XML template
created by an Emacs function.  The date, page id, and cross-link entity
references are automatically inserted by when the XML file is created
from the template.  I then edit the XML file in Emacs and when I'm
finished I run make in the top directory of my website hierarchy which
rebuilds the web site.  In the process it notices the new weblog entry
and runs a few tools that actually create the entities necessary for
cross linking and then runs jade or openjade (DSSSL processors) on the
master XML file for my website to create the HTML pages.  It has a very
plain look and feel, and it's rather crude, but it works.  It's primary
advantage is that it was easy to put together from pieces I already
had.

Sophisticated XML and XSL, etc.
-------------------------------

If you want to see a nice looking web site built using XML and XSL in
a sophisticated you should look at `norman.walsh.name
<http://norman.walsh.name/>`__ instead.  He supplies the `raw bits
<http://norman.walsh.name/2003/06/16/build>`__ necessary to figure out
how to put one together like it yourself, but hasn't packaged it up
(for very good reasons).  Sometime when I'm feeling ambitious I should
try to set up a website using his methods.

2014-11-04
==========

I use to build my website, including these log entries, using
Docbook XML.  As a static website it was ok, but as a blog it lacked a
lot of functionality.
