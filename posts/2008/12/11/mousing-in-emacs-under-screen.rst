.. title: Mousing in Emacs under Screen
.. slug: mousing-in-emacs-under-screen
.. date: 2008-12-11 12:46:02 UTC-05:00
.. tags: computer,tools,emacs,screen
.. category: computer/emacs
.. link: 
.. description: 
.. type: text


It `turns out`_ that if you execute the command `xterm-mouse-mode` (or
evaluate `(xterm-mouse-mode 1)` in your initialization file) when
running Emacs_ under Screen_ it allows “non-modified single clicks” to
work.  Normal mouse functionality is still available by holding the
Shift key while clicking.  I use the PuTTY_ ssh client for remote
access to various servers, and this works well Emacs in Screen under
PuTTY, too.

.. _`turns out`: http://savannah.gnu.org/bugs/?14930
.. _Emacs: http://www.gnu.org/software/emacs/
.. _Screen: http://www.gnu.org/software/screen/
.. _PuTTY: http://www.chiark.greenend.org.uk/~sgtatham/putty/
