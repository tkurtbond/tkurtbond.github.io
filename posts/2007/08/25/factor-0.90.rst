.. title: Factor 0.90
.. slug: factor-0.90
.. date: 2007-08-25 10:08:33 UTC-05:00
.. tags: factor,programming,timewarp
.. category: computer
.. link: 
.. description: 
.. type: text

It's been a while since I've looked at Factor_, and things are looking good. 

When using emacs with Factor under Microsoft Windows, remember to make
sure before you start Factor that ``emacsclient`` is in your path, and
then do::

    "editors.emacs" require

to tell Factor your going to use emacs.  After that, make sure that
you've started the server in emacs with ``server-start`` and try
something like::

    \ . edit

to see the definition of the ``.`` word.


.. Note:: This is a timewarp_ post.

.. _Factor: http://factorcode.org/
.. _timewarp: link://slug/new-blog-first-post
