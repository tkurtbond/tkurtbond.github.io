.. title: Emacs and Cygwin python
.. slug: emacs-and-cygwin-python
.. date: 2008-12-15 17:07:43 UTC-05:00
.. tags: emacs,python
.. category: computer/emacs
.. link: 
.. description: 
.. type: text


If you happen to be using `Windows Emacs`_ and Cygwin_ Python_ there's
an annoying interaction where “M-x run-python” hangs.  The easiest way
to fix it is to mount the directory where you have your emacs
installation into the Cygwin file name structure.  For instance, I
have my emacs installation in ``C:\emacs\emacs-22.2``, and in a
cygwin shell I did ``mount -b ‘C:\emacs' /emacs``, and now running the
Cygwin python works.

The emacs function ``run-python`` adds the emacs ``data-directory`` to
the ``PYTHONPATH`` in the emacs ``process-environment`` before running
python; unfortunately, since this is the MS Windows emacs, its
``data-directory`` starts with a drive letter and a colon.  When the
Cygwin python initializes ``sys.path`` it splits ``PYTHONPATH`` at the
colons, which means ``sys.path`` ends up with the drive letter as one
component (usually interpreted as a relative path) and everything
after the colon as another component.  It that's a valid Cygwin
pathname for the Emacs data directory (which is what the above mount
command did), things work (accidentally).

.. _`Windows Emacs`: http://www.gnu.org/software/emacs/windows/ntemacs.html
.. _Cygwin: http://www.cygwin.com/
.. _Python: http://www.python.org/
