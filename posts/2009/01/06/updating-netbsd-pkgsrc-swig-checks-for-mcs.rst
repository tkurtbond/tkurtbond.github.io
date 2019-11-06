.. title: Updating NetBSD pkgsrc: swig checks for mcs
.. slug: updating-netbsd-pkgsrc-swig-checks-for-mcs
.. date: 2009-01-06 14:42:20 UTC-05:00
.. tags: computer,os,netbsd,mono,c#,mcs,swig
.. category: computer/os/bsd
.. link: 
.. description: 
.. type: text


It turns out that if you are upgrading your pkgsrc packages in a
sandbox_ you really need to make sure that the home directory of the
user you are using exists in the sandbox, if you use any packages that
have a file:`configure` script that checks for `mcs`, since mono hangs
if it can't use the home directory.  Ugh.

.. _sandbox: http://diwp.blogspot.com/2006/09/manage-your-packages-in-sandbox-with.html
