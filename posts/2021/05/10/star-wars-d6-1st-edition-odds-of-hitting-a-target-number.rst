.. title: Star Wars D6 1st Edition Odds of Hitting a Target Number
.. slug: star-wars-d6-1st-edition-odds-of-hitting-a-target-number
.. date: 2021-05-10 11:58:00 UTC-04:00
.. tags: star wars d6 1e,dice,odds,rpg,mini six,opend6
.. category: gaming
.. link: 
.. description: 
.. type: text


After posting_ about the odds in :title:`Mini Six` (MS1_, MS2_) of
hitting a Target Number, I thought I should do the same for `Star
Wars: the Roleplaying Game`__, 1\ :sup:`st` Edition, the original Star
Wars roleplaying game, from `West End Games`_.  It does **NOT** use
the Wild Die; that was introduced in the 2\ :sup:`nd` Edition and is
also used in OpenD6_.

__ https://en.wikipedia.org/wiki/Star_Wars:_The_Roleplaying_Game
.. _MS1: https://www.drivethrurpg.com/product/144558/Mini-Six-Bare-Bones-Edition
.. _MS2: http://www.antipaladingames.com/p/mini-six.html
.. _West End Games: https://en.wikipedia.org/wiki/West_End_Games
.. _OpenD6: http://opend6project.org/

The `Anydice.com`_ code_ is very simple:

.. _Anydice.com: https://anydice.com
.. _code: https://anydice.com/program/22199/at_least

.. code::

   loop N over {1..12} {
     output Nd6 named "[N]D"
   }

If you enter this manually instead of following the “code” link above,
remember to click “At Least” to get the right results!

Star Wars D6 1\ :sup:`st` Edition does **NOT** use the Wild Die!

The multiple 100s from 6D onward are, after the first, not actually
100s, but 99.x where x is small enough it rounds up to 100.00 when
shown with two digits of precision.

The 0.00s that appear from 6D onwards are not 0.00, but numbers so
small that they appear as 0.00 when expressed with two digits of
precision.


.. _posting: link://slug/mini-six-odds-of-hitting-a-target-number


.. container:: smalltable boxedtable

   .. table:: Star Wars D6 1st Edition Odds of Hitting a Target Number
      :widths: auto

      ====== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ========
      \      **1D**   **2D**   **3D**   **4D**   **5D**   **6D**   **7D**   **8D**   **9D**   **10D**  **11D**  **12D**
      ====== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ========
      **1**  100.00                                                                                              
      **2**  83.33    100.00                                                                                     
      **3**  66.67    97.22    100.00                                                                            
      **4**  50.00    91.67    99.54    100.00                                                                   
      **5**  33.33    83.33    98.15    99.92    100.00                                                          
      **6**  16.67    72.22    95.37    99.61    99.99    100.00                                                 
      **7**           58.33    90.74    98.84    99.92    100.00   100.00                                        
      **8**           41.67    83.80    97.30    99.73    99.98    100.00   100.00                               
      **9**           27.78    74.07    94.60    99.28    99.94    100.00   100.00   100.00                      
      **10**          16.67    62.50    90.28    98.38    99.82    99.99    100.00   100.00   100.00             
      **11**          8.33     50.00    84.10    96.76    99.55    99.96    100.00   100.00   100.00   100.00    
      **12**          2.78     37.50    76.08    94.12    99.01    99.88    99.99    100.00   100.00   100.00   100.00
      **13**                   25.93    66.44    90.20    98.03    99.72    99.97    100.00   100.00   100.00   100.00
      **14**                   16.20    55.63    84.80    96.41    99.39    99.92    99.99    100.00   100.00   100.00
      **15**                   9.26     44.37    77.85    93.92    98.79    99.82    99.98    100.00   100.00   100.00
      **16**                   4.63     33.56    69.48    90.35    97.79    99.62    99.95    100.00   100.00   100.00
      **17**                   1.85     23.92    60.03    85.54    96.21    99.26    99.89    99.99    100.00   100.00
      **18**                   0.46     15.90    50.00    79.42    93.88    98.63    99.76    99.97    100.00   100.00
      **19**                            9.72     39.97    72.06    90.61    97.63    99.54    99.93    99.99    100.00
      **20**                            5.40     30.52    63.69    86.28    96.11    99.15    99.85    99.98    100.00
      **21**                            2.70     22.15    54.64    80.83    93.93    98.51    99.71    99.95    99.99
      **22**                            1.16     15.20    45.36    74.28    90.93    97.53    99.47    99.91    99.99
      **23**                            0.39     9.80     36.31    66.78    87.02    96.08    99.06    99.82    99.97
      **24**                            0.08     5.88     27.94    58.58    82.11    94.04    98.43    99.66    99.94
      **25**                                     3.24     20.58    50.00    76.23    91.29    97.48    99.41    99.89
      **26**                                     1.62     14.46    41.42    69.46    87.72    96.10    99.00    99.79
      **27**                                     0.72     9.65     33.22    61.98    83.28    94.20    98.37    99.63
      **28**                                     0.27     6.08     25.72    54.05    77.96    91.66    97.46    99.36
      **29**                                     0.08     3.59     19.17    45.95    71.81    88.40    96.15    98.95
      **30**                                     0.01     1.97     13.72    38.02    64.96    84.35    94.38    98.34
      **31**                                              0.99     9.39     30.54    57.61    79.50    92.03    97.46
      **32**                                              0.45     6.12     23.77    50.00    73.89    89.03    96.23
      **33**                                              0.18     3.79     17.89    42.39    67.60    85.33    94.57
      **34**                                              0.06     2.21     12.98    35.04    60.79    80.90    92.40
      **35**                                              0.02     1.21     9.07     28.19    53.63    75.76    89.64
      **36**                                              0.00     0.61     6.07     22.04    46.37    69.96    86.24
      **37**                                                       0.28     3.89     16.72    39.21    63.63    82.17
      **38**                                                       0.12     2.37     12.28    32.40    56.92    77.44
      **39**                                                       0.04     1.37     8.71     26.11    50.00    72.08
      **40**                                                       0.01     0.74     5.96     20.50    43.08    66.19
      **41**                                                       0.00     0.38     3.92     15.65    36.37    59.89
      **42**                                                       0.00     0.18     2.47     11.60    30.04    53.33
      **43**                                                                0.08     1.49     8.34     24.24    46.67
      **44**                                                                0.03     0.85     5.80     19.10    40.11
      **45**                                                                0.01     0.46     3.90     14.67    33.81
      **46**                                                                0.00     0.24     2.52     10.97    27.92
      **47**                                                                0.00     0.11     1.57     7.97     22.56
      **48**                                                                0.00     0.05     0.94     5.62     17.83
      **49**                                                                         0.02     0.53     3.85     13.76
      **50**                                                                         0.01     0.29     2.54     10.36
      **51**                                                                         0.00     0.15     1.63     7.60
      **52**                                                                         0.00     0.07     1.00     5.43
      **53**                                                                         0.00     0.03     0.59     3.77
      **54**                                                                         0.00     0.01     0.34     2.54
      **55**                                                                                  0.00     0.18     1.66
      **56**                                                                                  0.00     0.09     1.05
      **57**                                                                                  0.00     0.05     0.64
      **58**                                                                                  0.00     0.02     0.37
      **59**                                                                                  0.00     0.01     0.21
      **60**                                                                                  0.00     0.00     0.11
      **61**                                                                                           0.00     0.06
      **62**                                                                                           0.00     0.03
      **63**                                                                                           0.00     0.01
      **64**                                                                                           0.00     0.01
      **65**                                                                                           0.00     0.00
      **66**                                                                                           0.00     0.00
      **67**                                                                                                    0.00
      **68**                                                                                                    0.00
      **69**                                                                                                    0.00
      **70**                                                                                                    0.00
      **71**                                                                                                    0.00
      **72**                                                                                                    0.00
      ====== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ======== ========

Here's the Open Office spreadsheet_, here's the PDF_, and here's the
`raw data`_ from Anydice in CSV_ format.  (I saw the “Export” option,
finally.)  You can always look at the ReStructuredText_ source of this
page if you want the table in ReStructuredText_ format — there should
be link named "Source" at the beginning of this post if you are
visiting the article page (not the index page for the whole blog) what
will let you download it.

.. _spreadsheet: /star-wars-d6-1e-odds-of-hitting-a-target-number.ods
.. _PDF: /star-wars-d6-1e-odds-of-hitting-a-target-number.pdf
.. _raw data: /star-wars-d6-1e-odds-of-hitting-a-target-number.csv
.. _CSV: https://en.wikipedia.org/wiki/Comma-separated_values
.. _ReStructuredText: https://docutils.sourceforge.io/rst.html


Perhaps more immediately understandable is this screenshot of the the
results in graph mode:

.. image:: /images/star-wars-d6-1e-odds-of-hitting-a-target-number.png

(Right-clicking the image might give you the option to open the image
in a new tab, where you'll see it at full size.)

*Last edited: 2021-05-19 13:32:33 EDT*

..
   Local Variables:
   time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
