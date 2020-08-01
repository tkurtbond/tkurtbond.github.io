.. title: Paragraph Justification in groff and TeX
.. slug: paragraph-justification-in-groff-and-tex
.. date: 2020-07-31 22:42:15 UTC-04:00
.. tags: groff,tex,heirloom troff,neatroff,knuth-plass line-breaking algorithm
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app

An interesting message thread developed on the groff `mailing list`_
about various features of :app:`Groff` and :app:`Heirloom Troff`, with
a mention of :app:`neatroff`.  In particular, Steve Izma's post (P1_)
discussed how he found :app:`TeX`\'s paragraph-at-a-time justification
required as much tweaking as groff's simpler paragraph justification.
That lead to Peter Schaffter's post (P2_) linking to an earlier post
(P3_) where he proposed a simpler algorithm to improve :app:`Groff`\'s
line-breaking and justification than the full Knuth-Plass
Line-Breaking Algorithm (KP1_, D1_) that :app:`TeX` uses. While
writing this post I ran across another paper, “Global multiple
objective line breaking” by Alex Holkner (GMOLB1_, GMOLB2_) that explores
another line breaking algorithm and references some of the other
papers on the subject.

.. _mailing list: https://lists.gnu.org/archive/html/groff/
.. _P1: https://lists.gnu.org/archive/html/groff/2020-07/msg00092.html
.. _P2: https://lists.gnu.org/archive/html/groff/2020-07/msg00101.html
.. _P3: https://lists.gnu.org/archive/html/groff/2014-03/msg00322.html
.. _KP1: http://www.eprg.org/G53DOC/pdfs/knuth-plass-breaking.pdf
.. _D1: http://litherum.blogspot.com/2015/07/knuth-plass-line-breaking-algorithm.html
.. _GMOLB1: https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.585.8487
.. _GMOLB2: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.585.8487&rep=rep1&type=pdf
