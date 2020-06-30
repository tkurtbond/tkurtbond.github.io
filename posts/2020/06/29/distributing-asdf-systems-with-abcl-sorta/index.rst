.. title: Distributing ASDF systems with ABCL, sorta
.. slug: distributing-asdf-systems-with-abcl-sorta
.. date: 2020-06-29 16:30:21 UTC-04:00
.. tags: common lisp,abcl,asdf
.. category: computer/lisp
.. link: 
.. description: 
.. type: text

.. role:: file

The Reddit thread `How do you compile a runnable, deployable JAR with
ABCL?`__ doesn't offer a solution, unfortunately. [1]_ But it leads to
an `Armed Bear Common Lisp (ABCL)`__ TRAC ticket (T1_) which leads to
another (T2_) which leads some documentation on package ABCL for
distribution (D1_) which talks about how the `abcl-aio.jar`_ target is
used to package :file:`abcl.jar` and :file:`abcl-contrib.jar` for
distribution, then describes a way it might be done in the section
`Current Hack`_.

__ https://www.reddit.com/r/lisp/comments/2u7m4k/how_do_you_compile_a_runnable_deployable_jar_with/
__ https://abcl.org/
.. _T1: https://abcl.org/trac/ticket/383
.. _T2: https://abcl.org/trac/ticket/442
.. _D1: https://github.com/armedbear/abcl/blob/master/doc/packaging-abcl.org
.. _abcl-aio.jar: https://github.com/armedbear/abcl/blob/master/doc/packaging-abcl.org#abcl-aio
.. _Current Hack: https://github.com/armedbear/abcl/blob/master/doc/packaging-abcl.org#current-hack

Basically, it says:

    **Current hack**

    Ideally, we would like allow the AIO mechanism to include
    additional ASDF systems in the single jar artifact.

    Currently one can hack this together by:

    1. Manually extracting the abcl-aio.jar artifact to a file-system.
    2. Placing the necessary ASDF systems in the resulting “contrib”
       directory.
    3. Recreating the single archive from the file-system
       contents.


.. [1] Though it does talking about distributing an ABCL application
       as a servlet and WAR file. 
