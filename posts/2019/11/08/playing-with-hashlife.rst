.. title: Playing with Hashlife
.. slug: playing-with-hashlife
.. date: 2019-11-08 09:43:19 UTC-05:00
.. tags: common lisp,life,hashlife
.. category: computer
.. link: 
.. description: 
.. type: text

C.P. found `Robert Smith`_'s implementation_ of Bill Gosper's HASHLIFE
algorithm and wanted my help with running it.  I cloned the repo_ it
was in and ran ``sbcl`` in the ``hashlife`` directory.  Then I
entered:

.. code:: lisp

    (asdf:operate 'asdf:load-op 'charmlife)
    
That result in ``Component CHARMLIFE not found`` error in sbcl.  I
thought that was odd — it was right there in the current directory.  I
looked at ``asdf:*central-registry*``, and the only thing in it was
the quicklisp directory.  The ASDF howto_ showed an example of setting
``asdf:*central-registry*``:

.. code:: lisp

    (setf asdf:*central-registry*
      ;; Default directories, usually just the ``current directory''
      '(*default-pathname-defaults*

        ;; Additional places where ASDF can find
        ;; system definition files
        #p"/home/foo/lisp/systems/"
        #p"/usr/share/common-lisp/systems/"))
        
Noticing that it had the symbol ``*default-pathname-defaults*`` in the
new value, I guessed that it being missing from mine caused ASDF to
not find the system in the current directory.  So I added it and tried
again.  This time ASDF couldn't find ``cl-charms``.  I guessed and
used Quicklisp_ to load it.  That worked.  Then I looked at
``charmlife.lisp`` and looked at the ``main`` function and figured out
how to run it and how to interact with the program when it was running.

.. _`Robert Smith`: https://github.com/stylewarning
.. _implementation: https://github.com/stylewarning/lisp-random/tree/master/hashlife
.. _repo: https://github.com/stylewarning/lisp-random
.. _howto: https://common-lisp.net/~mmommer/asdf-howto.shtml#sec11
.. _Quicklisp: https://www.quicklisp.org/

Here's what I had to do:

.. code:: lisp

    (setf asdf:*central-registry*
          (cons '*default-pathname-defaults*
                asdf:*central-registry*))
    (ql:quickload "cl-charms")
    (asdf:operate 'asdf:load-op 'charmlife)
    (charmlife:main)
