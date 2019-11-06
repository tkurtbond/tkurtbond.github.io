.. title: Cygwin setup crashes updating bash
.. slug: cygwin-setup-crashes-updating-bash
.. date: 2008-11-26 15:57:51 UTC-05:00
.. tags: computer,tools,bash,corrupted,cygwin,setup.exe,upgrade
.. category: computer
.. link: 
.. description: 
.. type: text


Thanks to the wonders of Google and Ruben_ I finally found the answer:
remove (you'll want to make a backup copy before you remove it,
though) ``/etc/setup/bash.lst.gz`` which apparently had become
corrupted.

.. _Ruben: http://rubenlaguna.com/wp/2007/11/05/cygwin-setupexe-crashes-whem-upgrading-packages/

According to a comment on that post, running ``gunzip -t`` on all
files in ``/etc/setup`` will tell you which setup files have been
corrupted.
