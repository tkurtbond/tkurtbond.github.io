.. title: bash startup on Ubuntu 8.04.1 ridiculously slow!
.. slug: bash-startup-on-ubuntu-8041-ridiculously-slow
.. date: 2008-09-13 01:20:23 UTC-05:00
.. tags: computer,tools,ubuntu
.. category: computer
.. link: 
.. description: 
.. type: text


I installed Ubuntu_ 8.04.1 on a Pentium II machine with 256MiB and was
disturbed by how slowly it seemed.  It turns out that it was just that
``bash`` was starting incredibly slowly.  Removing the default Ubuntu
``~/.bashrc`` fixed it.  It turns out to be something in
/etc/bash_completion which causes the slowdown, but I haven't figured
out what yet.

.. _Ubuntu: http://www.ubuntu.com
