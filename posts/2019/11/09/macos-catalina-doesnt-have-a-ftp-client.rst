.. title: macOS Catalina doesn't have a FTP client!
.. slug: macos-catalina-doesnt-have-a-ftp-client
.. date: 2019-11-09 22:00:04 UTC-05:00
.. tags: macos,catalina,ftp
.. category: computer
.. link: 
.. description: 
.. type: text

Ack!  macOS Catalina doesn't have an FTP client!  Yes, I know it is
terribly insecure, but I only use it inside our firewall to access one
legacy computer system.  I was glad brew_ had ``LFTP``, and I figured out
how to use active mode in ``LFTP``:

.. code:: bash

    set ftp:passive-mode off

.. _brew: https://brew.sh/
