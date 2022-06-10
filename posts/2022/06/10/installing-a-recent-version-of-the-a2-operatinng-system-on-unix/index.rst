.. title: Installing a recent version of the A2 operatinng system on UNIX
.. slug: installing-a-recent-version-of-the-a2-operatinng-system-on-unix
.. date: 2022-06-10 11:28:40 UTC-04:00
.. tags: oberon,a2,aos,bluebottle,macos,unix
.. category: computer/unix
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: command

I recently ran across a document_ that explains how to install the A2_
operating system (formerly Bluebottle, formerly Aos) in the form of
UnixAos hosted on macOS, in the process of explaining how to make a
installer for macOS.  I think the same process will work for any
supported Unix.

.. _document: https://svn.inf.ethz.ch/svn/lecturers/a2/trunk/UnixAos/DarwinA2%20Installer/ReadMeFirst!.txt
.. _A2: https://en.wikipedia.org/wiki/A2_(operating_system)

I'll summarize what I did.

I went to `http://www.informatik.uni-bremen.de/~fld/UnixAos/`__ and
selected the most recent revision, `rev.9799`_ at the time of this
writing.  There I downloaded the install script, `install.UnixA2`_ and
the version for 64 bit macOS, `DarwinA2-64bit.tgz`_.  (There were also
Linux and Solaris versions for 32 and 64 bit systems.)

.. _`rev.9799`: http://www.informatik.uni-bremen.de/~fld/UnixAos/rev.9799/
.. _`install.UnixA2`: http://www.informatik.uni-bremen.de/~fld/UnixAos/rev.9799/install.UnixA2
.. _`DarwinA2-64bit.tgz`: http://www.informatik.uni-bremen.de/~fld/UnixAos/rev.9799/DarwinA2-64bit.tgz
__ http://www.informatik.uni-bremen.de/~fld/UnixAos/

The install script assumes you are running as root, but I ran it first
as my normal user, and since the directory I was installing it to was
owned by me it seems to have worked ok.

I installed to :file:`/usr/local/sw/versions/aos/rev.9799`, but I had
to create that directory first.  And I installed the :command:`aos`
command to a directory in my path.  Then when I issued the command
``aos`` it started up and displayed a window with A2 running in it.
This requires X Windows, so you'll need to install XQuartz_.

Here's a screen shot:

.. figure:: /a2-screenshot.png
   :alt: Screenshot of A2 running under macOS

   Screenshot of A2 running under macOS

.. _XQuartz: https://www.xquartz.org/

I started it and it seems to work ok, though I haven't investigated
very much.
