.. title: Getting .MOBI files on my Kindle Paperwhite
.. slug: getting-mobi-files-on-my-kindle-paperwhite
.. date: 2020-07-01 21:08:20 UTC-04:00
.. tags: kindle,mobi,amazon,calibre epub,epub
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: file

I created a :file:`.epub` file using pandoc_.  Then I converted the
:file:`.epub` to .mobi via the `Calibre epub
software`__. [#alternative]_ Then I tried copying the :file:`.mobi` to
the :file:`Documents` folder on the Kindle via USB (which several
places online say is the way to do it) but that didn’t show up when I
looked (and searched) my library.

So I had to mail it to my Kindle.

- Go on Amazon,
- select “Account & Lists > Your Content and Devices > Preferences tab (at the top of the
  page, under the normal black Amazon menu/search area) > Personal
  Document Settings”.
- Then copy the email from your “Send-To-Kindle
  E-Mail Settings” and create an e-mail to it.  
- Check that the “Approved
  Personal Document E-mail List” contains your e-mail address, or add a
  new one.  
- Then attach the :file:`.mobi` file to the e-mail and send it.
- After a little while you’ll get a “Verify your Kindle document” from Amazon
  with a link to click to verify it.  Click it.
- After a little while you can go
  back to the “Content” tab and search your content for the title, and
  it should be there.  You can also change the “Show” combo box at the
  top of the page to “Docs” instead of “Books” and it should be listed
  there, too.  

Weeeee!

.. [#alternative]
   I could have used KindleGen_, a command line tool from Amazon,
   instead.  You can download it yourself from that page for Windows,
   macOS, and Linux.  If you use a macOS computer you can use Homebrew_ to
   install it:

   .. code:: bash

      brew install kindlegen

   I haven't actually used KindleGen, though.

.. _pandoc: https://pandoc.org/epub
__ https://calibre-ebook.com/
.. _KindleGen: https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211
.. _Homebrew: https://brew.sh/
