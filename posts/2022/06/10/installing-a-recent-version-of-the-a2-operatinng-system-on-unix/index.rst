 .. title: Installing a recent version of the A2 operatinng system on UNIX
.. slug: installing-a-recent-version-of-the-a2-operatinng-system-on-unix
.. date: 2022-06-10 11:28:40 UTC-04:00
.. tags: oberon,a2,aos,bluebottle,macos,unix,fedora
.. category: computer/unix
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: command

I recently ran across a document_ that explains how to install the A2_
operating system (formerly Bluebottle, formerly Aos) in the form of
UnixAos hosted on macOS_, in the process of explaining how to make a
installer for macOS.  I think the same process will work for any
supported Unix.  [**Later:** indeed, I used the `LinuxA2-64bit.tgz`_ file
and the same process worked fine on my Fedora_ box.]

.. _document: https://svn.inf.ethz.ch/svn/lecturers/a2/trunk/UnixAos/DarwinA2%20Installer/ReadMeFirst!.txt
.. _A2: https://en.wikipedia.org/wiki/A2_(operating_system)
.. _macOS: https://en.wikipedia.org/wiki/MacOS
.. _LinuxA2-64bit.tgz: http://www.informatik.uni-bremen.de/~fld/UnixAos/rev.9799/LinuxA2-64bit.tgz
.. _Fedora: https://en.wikipedia.org/wiki/Fedora_Linux

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

Then I executed ``chmod +x``'ed the install script and ran it, passing
the :file:`.tgz` file to it.

First, it asks for the installation directory, which should already
exist.  It has a default, but I installed to the directory
:file:`/usr/local/sw/versions/aos/rev.9799`.  Again, I had to create
that directory first.  (I don't like to write into :file:`/usr` or
:file:`/usr/local`, because those directory hierarchies are often
under the systems control.  Nobody uses :file:`/usr/local/sw` for
anything except me.)

Second, it asks for the file name to copy the :file:`aos` script to.
I installed the :command:`aos` command to
:file:`/Users/tkb/local/rndbin`, (:file:`/home/tkb/local/rndbin` on
non-macOS systems) which is in my path.

The install script assumes you are running as root, but I ran it first
as my normal user, and since the directory I was installing it to was
owned by me it seems to have worked ok, even though it complained
about :command:`chgrp` not being able to change the group of a *bunch*
of files.

Then when I issued the command ``aos`` it started up and displayed a
window with A2 running in it.  (This requires X Windows, so you'll need
to install XQuartz_ on macOS.)

.. _XQuartz: https://www.xquartz.org/

Here's a screen shot from macOS:

.. figure:: /a2-screenshot.png
   :alt: Screenshot of A2 running under macOS

   Screenshot of A2 running under macOS

It seems to work ok, both on macOS and Fedora, though I haven't
investigated very much.

*Last edited: 2022-06-12 15:39:49 EDT*

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
