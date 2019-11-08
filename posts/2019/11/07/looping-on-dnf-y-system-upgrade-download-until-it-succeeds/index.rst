.. title: Looping on 'dnf -y system-upgrade download' until it succeeds
.. slug: looping-on-dnf-y-system-upgrade-download-until-it-succeeds
.. date: 2019-11-07 21:16:59 UTC-05:00
.. tags: fedora,bash,dnf
.. category: computer
.. link: 
.. description: 
.. type: text

Fedora 31 is out, and fool that I am I'm upgrading to it.
Unfortunately, my DSL connection is slow and my DSL modem router is flaky.
With over 3000 packages to download,

.. code:: bash

    dnf -y system-upgrade download --refresh --releasever=31

is bound to die in the middle at least once, if not multiple times,
and with more than 6 hours estimated for the download to run I can't
sit watching it and restarting it every time it dies.

I tried running ``dnf`` as the argument to a while loop, but was
unable to C-c to interrupt it when I *did* want to kill it since
``dnf`` caught the SIGINT and the loop started the ``dnf`` command
over again before I could C-c the shell.

Here's the script I came up with to work around the issue:

.. listing:: tryfedoraupdate bash
             :number-lines:

This way I can stop the script easily, but if it dies itself it will
continue after a timeout.
