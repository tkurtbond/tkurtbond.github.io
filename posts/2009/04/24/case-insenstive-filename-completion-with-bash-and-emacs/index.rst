.. title: Case-insenstive filename completion with bash and emacs
.. slug: case-insenstive-filename-completion-with-bash-and-emacs
.. date: 2009-04-24 13:59:07 UTC-05:00
.. tags: emacs,bash,computer
.. category: computer
.. link: 
.. description: 
.. type: text


.. role:: program

It's strange, I know, that while I like case sensitive filenames, I
don't actually want to be bothered matching the case exactly when I'm
using tab completion.  Fortunately, :program:`emacs` and
:program:`bash` both accommodate my whims.  For bash, add

.. class:: code

::

    set completion-ignore-case on

to your ``~/.inputrc`` file.  For emacs, add

.. class:: code

::

   (read-file-name-completion-ignore-case t)

to your emacs initialization files.  Of course, if want to get rid of
all completion case sensitivity, you need

.. class:: code

::

    (setq completion-ignore-case t)

too.

