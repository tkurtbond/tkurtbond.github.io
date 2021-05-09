.. title: Mini Six Odds of Hitting a Target Number
.. slug: mini-six-odds-of-hitting-a-target-number
.. date: 2021-05-08 22:49:20 UTC-04:00
.. tags: mini six,dice,wild die,rpg
.. category: gaming
.. link: 
.. description: 
.. type: text

I couldn't find anywhere on the net showing the percentage chance of
hitting a target number using the Mini Six Wild Die, which just
explodes on a 6, unlike the OpenD6 Wild Die, which explodes on a 6,
but if a 1 is rolled on the initial roll it instead either removes the
highest die rolled or causes a complication, depending on what the GM
wants.

I much prefer the Mini Six Wild Die.

So I went off to `Anydice.com`_ and came up with the following code:

.. _Anydice.com: https://anydice.com/program/2212d

.. code::

   output [explode d6] named "1M"
   loop N over {1..11} {
     X: N+1
     output [explode d6] + Nd6 named "[X]M"
   }

Remember to click “At Least” to get the right results!

Then I transcribed the results into a spreadsheet.

The blank spots in the 1D column are because you can’t roll a 6 or a
12 on 1D with the Mini Six Wild Die.  I'm not sure why the result for
18 isn't blank...

The multiple 100s from 6D onwards are, except for the first, not
actually 100s, but instead 99.x where x is small enough it rounds up
to 100.00 with two digits of precision.

I got the data from from Anydice.com; if there are errors, it's
probably a typo on my part while transcribing the data.

.. container:: smalltable boxedtable

   .. table:: Mini Six Odds of Hitting a Target Number
      :widths: auto

      ====== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ========
      \       1D       2D       3D       4D       5D       6D       7D       8D       9D       10D      11D      12D
      ====== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ========
      **1**  100.00                                                                                              
      **2**  83.33    100.00                                                                                     
      **3**  66.67    97.22    100.00                                                                            
      **4**  50.00    91.67    99.54    100.00                                                                   
      **5**  33.33    83.33    98.15    99.92    100.00                                                          
      **6**           72.22    95.37    99.61    99.99    100.00                                                 
      **7**  16.67    58.33    90.47    98.84    99.92    100.00   100.00                                        
      **8**  13.89    44.44    83.80    97.30    99.73    99.98    100.00   100.00                               
      **9**  11.11    32.87    74.54    94.60    99.28    99.94    100.00   100.00   100.00                      
      **10** 8.33     23.61    63.81    90.35    98.39    99.82    99.99    100.00   100.00   100.00             
      **11** 5.56     16.67    52.47    84.40    96.77    99.55    99.96    100.00   100.00   100.00   100.00    
      **12**          12.04    41.36    76.79    94.19    99.01    99.88    99.99    100.00   100.00   100.00   100.00
      **13** 2.78     9.72     31.33    67.79    90.38    98.04    99.72    99.97    100.00   100.00   100.00   100.00
      **14** 2.31     7.41     23.23    57.88    85.20    96.45    99.39    99.92    99.99    100.00   100.00   100.00
      **15** 1.85     5.48     17.05    47.79    78.64    94.03    98.80    99.82    99.98    100.00   100.00   100.00
      **16** 1.39     3.94     12.49    38.21    70.83    90.59    97.82    99.62    99.95    100.00   100.00   100.00
      **17** 0.93     2.78     9.21     29.65    62.14    86.00    96.28    99.26    99.89    99.99    100.00   100.00
      **18** 0.46     1.16     6.89     22.44    53.02    80.23    94.02    98.65    99.77    99.97    100.00   100.00
      **19**          0.77     5.22     16.70    43.96    73.37    90.89    97.67    99.54    99.93    99.99    100.00
      **20**          0.46     3.87     12.35    35.45    65.63    86.78    96.20    99.16    99.85    99.98    100.00
      **21**          0.23     2.83     9.12     27.86    57.34    81.64    94.10    98.54    99.71    99.96    99.99
      **22**          0.08     2.04     6.75     21.41    48.88    75.53    91.24    97.58    99.47    99.91    99.99
      **23**                   1.47     5.01     16.17    40.64    68.57    87.52    96.19    99.08    99.82    99.97
      **24**                   1.04     3.72     12.06    32.98    61.01    82.91    94.23    98.46    99.67    99.94
      **25**                   0.72     2.75     8.94     26.15    53.14    77.41    91.61    97.54    99.42    99.89
      **26**                   0.45     2.00     6.62     20.31    45.27    71.11    88.23    96.22    99.02    99.79
      **27**                   0.26     1.43     4.89     15.51    37.72    64.19    84.05    94.40    98.41    99.63
      **28**                   0.13     1.00     3.61     11.68    30.74    56.87    79.06    91.98    97.53    99.38
      **29**                   0.05     0.68     2.65     8.71     24.55    49.41    73.34    88.89    96.28    98.98
      **30**                   0.01     0.44     1.93     6.46     19.22    42.07    66.98    85.09    94.58    98.39
      **31**                            0.27     1.38     4.77     14.81    35.11    60.18    80.55    92.35    97.54
      **32**                            0.15     0.97     3.51     11.24    28.72    53.13    75.31    89.52    96.36
      **33**                            0.08     0.66     2.57     8.44     23.05    46.06    69.46    86.04    94.78
      **34**                            0.03     0.44     1.87     6.29     18.17    39.20    63.13    81.88    92.72
      **35**                            0.01     0.27     1.34     4.65     14.09    32.75    56.48    77.07    90.11
      **36**                                     0.16     0.94     3.42     10.78    26.87    49.72    71.67    86.91
      **37**                                     0.09     0.65     2.50     8.14     21.65    43.03    66.77    83.09
      **38**                                     0.05     0.43     1.81     6.09     17.16    36.61    59.52    78.66
      **39**                                     0.02     0.28     1.30     4.52     13.39    30.62    53.07    73.66
      **40**                                     0.01     0.17     0.92     3.33     10.30    25.17    46.60    68.16
      **41**                                              0.10     0.63     2.43     7.82     20.35    40.27    62.28
      **42**                                              0.05     0.43     1.76     5.88     16.20    34.25    56.15
      **43**                                              0.03     0.28     1.26     4.38     12.70    28.66    49.91
      **44**                                              0.01     0.18     0.89     3.23     9.82     23.61    43.73
      **45**                                              0.01     0.11     0.62     2.37     7.50     19.14    37.74
      **46**                                                       0.06     0.42     1.72     5.66     15.29    32.09
      **47**                                                       0.03     0.28     1.23     4.23     12.04    26.87
      **48**                                                       0.02     0.18     0.88     3.14     9.35     22.16
      **49**                                                       0.01     0.11     0.61     2.30     7.18     18.02
      **50**                                                                0.07     0.42     1.67     5.44     14.43
      **51**                                                                0.04     0.28     1.20     4.08     11.41
      **52**                                                                0.02     0.18     0.86     3.03     8.90
      **53**                                                                0.01     0.12     0.60     2.23     6.85
      **54**                                                                         0.07     0.41     1.63     5.22
      **55**                                                                         0.04     0.28     1.18     3.93
      **56**                                                                         0.02     0.19     0.84     2.93
      **57**                                                                         0.01     0.12     0.59     2.17
      **58**                                                                         0.01     0.08     0.41     1.58
      **59**                                                                                  0.05     0.28     1.15
      **60**                                                                                  0.03     0.19     0.82
      **61**                                                                                  0.02     0.12     0.58
      **62**                                                                                  0.02     0.08     0.40
      **63**                                                                                           0.05     0.28
      **64**                                                                                           0.03     0.19
      **65**                                                                                           0.02     0.12
      **66**                                                                                           0.01     0.08
      **67**                                                                                           0.01     0.05
      **68**                                                                                                    0.03
      **69**                                                                                                    0.02
      **70**                                                                                                    0.01
      **71**                                                                                                    0.01
      **72**                                                                                                     
      ====== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ========

Here's the Open Office spreadsheet_, and here's the PDF_.  You can
always look at the ReStructuredText_ source of this page - there
should be link named "Source" at the beginning of this post if you are
visiting the article page (not the index page for the whole blog) what
will let you download it.

.. _spreadsheet: /mini-six-wild-die-target-number-odds.ods
.. _PDF: /mini-six-wild-die-target-number-odds.pdf
.. _ReStructuredText: https://docutils.sourceforge.io/rst.html


Perhaps more immediately understandable is this screenshot of the the
results in graph mode:

.. image:: /images/mini-six-odds-of-hitting-a-target-number.png

(Right-clicking the image might give you the option to open the image
in a new tab, where you'll see it at full size.)
