.. title: NetBSD: pkg_add: Error: package `emacs-24.0.50.20110821' was built with a newer pkg_install version
.. slug: netbsd-pkgadd-error-package-pkgname-was-built-with-a-newer-pkginstall-version
.. date: 2012-05-17 17:25:26 UTC-05:00
.. tags: netbsd,pkgsrc
.. category: computer
.. link: 
.. description: 
.. type: text


I did a fresh install of NetBSD 5.1.2 and tried to install emacs::

    # pkg_add emacs    
    pkg_add: Error: package `emacs-24.0.50.20110821' was built with a newer pkg_install version
    pkg_add: 1 package addition failed

So I installed pkgsrc and did a ``make install`` in
``/usr/pkgsrc/pkgtools/pkg_install``.

Then I added ``/usr/pkg/sbin:/usr/pkg/bin`` to the front of my path,
and tried again.  That seemed to work.
