.. title: pandoc-discuss post: Can the .RS/.RE macros in ms output be replaced with .QS/.QE?
.. slug: pandoc-discuss-post-can-the-rsre-macros-in-ms-output-be-replaced-with-qsqe
.. date: 2020-03-11 20:35:47 UTC-04:00
.. tags: pandoc,groff,ms macros,block quotes,.QS/.QE,.RS/.RE
.. category: computer
.. link: 
.. description: 
.. type: text

On March 9, 2020 I made a post_ on the pandoc-discuss mailing list
that explains some changes to pandoc to better handle block quotes in
ms output, and a workaround for it until the version with changes
comes out, but I forgot to mention it here.

In short, use a pipeline like this:

.. listing:: GNUmakefile.change-RS-RE-to-QS-QE make

.. _post: https://groups.google.com/forum/#!topic/pandoc-discuss/zulmB6uujgc
