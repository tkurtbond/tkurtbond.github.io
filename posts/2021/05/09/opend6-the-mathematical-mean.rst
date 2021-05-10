.. title: OpenD6: The Mathematical Mean
.. slug: opend6-the-mathematical-mean
.. date: 2021-05-09 01:57:29 UTC-04:00
.. tags: opend6,mini six,rpg,star wars d6
.. category: gaming
.. link: 
.. description: 
.. type: text

Another concept that I've found useful for preparing for `Star Wars:
The Roleplaying Game`__, OpenD6_ or
*Mini Six* (MS1_, MS2_) games is “The Mathematical Mean”, which I
first saw at `The OpenD6 Project`__.  I'll quote it here for reference.

__ https://en.wikipedia.org/wiki/Star_Wars:_The_Roleplaying_Game
.. _OpenD6: http://opend6project.org/
.. _MS1: https://www.drivethrurpg.com/product/144558/Mini-Six-Bare-Bones-Edition
.. _MS2: http://www.antipaladingames.com/p/mini-six.html
__ http://opend6project.org/?page_id=53

The Mathematical Mean
=====================

In the standard rules, traits are rated by whole and partial increments
of six-sided dice. A whole die increment is written as “1D”, where the
integer denotes a number of dice to be rolled and totaled. Partial die
increments are written as “1D+1”, where the primary identity denotes a
number of dice to be rolled and totaled, and the secondary identity
denotes an absolute value to be added to the sum total.

Conflict resolution in OpenD6 is based on a standardized difficulty
scale that is adjusted for the mathematical mean of a given trait score.

On this difficulty scale, a “Moderate” difficulty is defined as a number
approximating the mean roll of a trait score totaling between 3D and 4D,
so that the sum total of a trait roll will equal or exceed the
difficulty on approximately 50% of a given set of iterations.
Difficulties are then derived mathematically in multiples of 3.5, where
the corresponding descriptive value is derived in multiples of 5. Each
die code corresponds to a difficulty computed using a fixed value equal
to 3.5x the whole die increment, and adding the partial die increments
(pips) to the sum total.

The purpose of defining a “Moderate” difficulty with this range of
values is to approximate a 50% success ratio for the most common trait
totals assigned to protagonists and antagonists within the system, as
well as to provide an increasing success ratio to higher trait totals.
The 50% success ratio can be adjusted along a sliding scale to
correspond to higher trait totals.

The purpose of providing descriptive values for each numerical value
allows difficulties to be evaluated quickly relative to a baseline trait
score of 3D.

.. container:: smalltable boxedtable 

   .. table:: Standardized Difficulty Table
      :widths: auto

      ============================= ========== ======== ===========
      Description                   Difficulty Die Code Mean Result
      ============================= ========== ======== ===========
      Very Easy                     1          1        1
      \                             2          2        2
      \                             3                   
      \                             4          1D       3.5
      \                             5          1D+1     4.5
      Easy                          6          1D+2     5.5
      \                             7          2D       7
      \                             8          2D+1     8
      \                             9          2D+2     9
      \                             10                  
      Moderate                      11         3D       10.5
      \                             12         3D+1     11.5
      \                             13         3D+2     12.5
      \                             14         4D       14
      \                             15         4D+1     15
      Difficult                     16         4D+2     16
      \                             17                  
      \                             18         5D       17.5
      \                             19         5D+1     18.5
      \                             20         5D+2     19.5
      Very Difficult                21         6D       21
      \                             22         6D+1     22
      \                             23         6D+2     23
      \                             24                  
      \                             25         7D       24
      Heroic                        26         7D+1     25.5
      \                             27         7D+2     26.5
      \                             28         8D       28
      \                             29         8D+1     29
      \                             30         8D+2     30
      ============================= ========== ======== ===========

Here is a PDF_ with a nicely formatted version of these tables (5½×8½
inches, suitable for adding to a booklet, or printing two up on on
8½x11 inch Letter paper) , and the ConTeXt_ source_.  You can always
look at the ReStructuredText_ source of this page - there
should be link named "Source" at the beginning of this post if you are
visiting the article page (not the index page for the whole blog) what
will let you download it.

.. _PDF: /the-mathematical-mean.pdf
.. _ConTeXt: https://en.wikipedia.org/wiki/ConTeXt
.. _source: /the-mathematical-mean.ctx
.. _ReStructuredText: https://docutils.sourceforge.io/rst.html
