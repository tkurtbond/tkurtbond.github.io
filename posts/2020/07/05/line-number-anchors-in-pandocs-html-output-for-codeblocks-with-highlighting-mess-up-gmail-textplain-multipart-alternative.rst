.. title: Line number anchors in pandoc's HTML output for codeblocks with highlighting mess up Gmail text/plain multipart alternative
.. slug: line-number-anchors-in-pandocs-html-output-for-codeblocks-with-highlighting-mess-up-gmail-textplain-multipart-alternative
.. date: 2020-07-05 18:48:44 UTC-04:00
.. tags: pandoc,html,rst,gmail
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: file(literal)

I’ve found that if I write something in ReStructuredText_, create HTML
from it and embed a stylesheet with the proper css in the
:file:`.html` file using pandoc_’s ``--include-in-header`` option that
I can cut and paste from the web page displayed in my browser from
that HTML directly into gmail, and things like code blocks and literal
text will have the nice surrounded by a box, light gray background
formatting that carries over to Gmail_.  That's nice because Gmail's
native formatting is a … minimalist user experience.

.. _ReStructuredText: https://docutils.sourceforge.io/rst.html
.. _pandoc: https://pandoc.org/
.. _Gmail: https://www.google.com/gmail/

However, I've found that if I use the ``.. include::`` directive with
the ``:code:`` option (which basically makes it a code block) and
specify a language for highlighting with an argument to the ``:code:``
option that the text/html part in the resulting multipart/alternative
e-mail displays fine in Gmail (and probably other `mail user agent`_\s
that display the HTML part; Mew_ in Emacs works too), but the
``text/plain`` part is messed up, with weird HTML-like tags in the
plain text. [#plain-code-directive]_

.. _Mew: http://www.mew.org/en/

For instance, suppose I have the following RST source for the message
I want to write (:file:`missing-ampersand.rst`):

.. code:: restructuredtext
   
   :title: Missing Ampersand in Code Blocks in ``-ms`` Output

   Here's some ReStructuredText input that has a code block in it:

   .. include:: ma.rst
      :code: restructuredtext

   Here's the ``-ms`` output from it:

   .. include:: ma-rst.ms
      :code: nroff

   See the first line that starts with ``.. container::``?  That line
   should start with ``\&`` so it isn't interpreted as an **roff**
   command.  As it is, when you build the PDF output from output that
   line disappears entirely with no warning to the user.  (The default
   for **roff** processors like **groff** is to ignore unknown commands.)

   See the second line that starts with ``.. container::``?  That line
   **does** start with ``\&``.  It makes it through fine.  The other
   lines whose first non-whitespace character is ``.`` make it through
   fine because to make it a **roff** command the first character on the
   line has to be a period.

where the included ReStructuredText_ file (:file:`ma.rst`) is

.. code:: restructuredtext

   Missing Ampersand in Code Block -ms output
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   Here's a code block containing ReStructuredText:

   .. code::

      .. container:: for-format ms

         .. figure:: davesmapper-2017-04-10-caves-4-numbered.eps
            :alt: Map of Bandit's Cave

         Map of Bandit's Cave

      .. container:: for-format html latex context epub

         .. figure:: davesmapper-2017-04-10-caves-4-numbered.png
            :alt: Map of Bandit's Cave

            Map of Bandit's Cave

   How's that look?
   
and the included roff source file (:file:`ms-rst.ms`) is

.. code:: groff

   .SH 1
   Missing Ampersand in Code Block -ms output
   .pdfhref O 1 "Missing Ampersand in Code Block -ms output"
   .pdfhref M "missing-ampersand-in-code-block--ms-output"
   .LP
   Here\[aq]s a code block containing ReStructuredText:
   .IP
   .nf
   \f[C]
   .. container:: for-format ms

      .. figure:: davesmapper-2017-04-10-caves-4-numbered.eps
         :alt: Map of Bandit\[aq]s Cave

      Map of Bandit\[aq]s Cave

   \&.. container:: for-format html latex context epub

      .. figure:: davesmapper-2017-04-10-caves-4-numbered.png
         :alt: Map of Bandit\[aq]s Cave

         Map of Bandit\[aq]s Cave
   \f[]
   .fi
   .LP
   How\[aq]s that look?


Then the resulting HTML output for the first code block [#toolong]_ is:

.. code:: html

   <div class="sourceCode" id="cb1"><pre class="sourceCode restructuredtext"><code class="sourceCode rest"><span id="cb1-1"><a href="#cb1-1"></a>Missing Ampersand in Code Block -ms output</span>
   <span id="cb1-2"><a href="#cb1-2"></a>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</span>
   <span id="cb1-3"><a href="#cb1-3"></a></span>
   <span id="cb1-4"><a href="#cb1-4"></a>Here&#39;s a code block containing ReStructuredText:</span>
   <span id="cb1-5"><a href="#cb1-5"></a></span>
   <span id="cb1-6"><a href="#cb1-6"></a><span class="dt">.. code::</span></span>
   <span id="cb1-7"><a href="#cb1-7"></a></span>
   <span id="cb1-8"><a href="#cb1-8"></a><span class="dt">   .. container:: for-format ms</span></span>
   <span id="cb1-9"><a href="#cb1-9"></a></span>
   <span id="cb1-10"><a href="#cb1-10"></a><span class="dt">      .. figure:: davesmapper-2017-04-10-caves-4-numbered.eps</span></span>
   <span id="cb1-11"><a href="#cb1-11"></a><span class="dt">         :alt: Map of Bandit&#39;s Cave</span></span>
   <span id="cb1-12"><a href="#cb1-12"></a></span>
   <span id="cb1-13"><a href="#cb1-13"></a><span class="dt">      Map of Bandit&#39;s Cave</span></span>
   <span id="cb1-14"><a href="#cb1-14"></a></span>
   <span id="cb1-15"><a href="#cb1-15"></a><span class="dt">   .. container:: for-format html latex context epub</span></span>
   <span id="cb1-16"><a href="#cb1-16"></a></span>
   <span id="cb1-17"><a href="#cb1-17"></a><span class="dt">      .. figure:: davesmapper-2017-04-10-caves-4-numbered.png</span></span>
   <span id="cb1-18"><a href="#cb1-18"></a><span class="dt">         :alt: Map of Bandit&#39;s Cave</span></span>
   <span id="cb1-19"><a href="#cb1-19"></a></span>
   <span id="cb1-20"><a href="#cb1-20"></a><span class="dt">         Map of Bandit&#39;s Cave</span></span>
   <span id="cb1-21"><a href="#cb1-21"></a></span>
   <span id="cb1-22"><a href="#cb1-22"></a>How&#39;s that look?</span>
   <span id="cb1-23"><a href="#cb1-23"></a></span></code></pre></div>

And the HTML output for the second code block is:

.. code:: html
          
   <pre class="nroff"><code>.SH 1
   Missing Ampersand in Code Block -ms output
   .pdfhref O 1 &quot;Missing Ampersand in Code Block -ms output&quot;
   .pdfhref M &quot;missing-ampersand-in-code-block--ms-output&quot;
   .LP
   Here\[aq]s a code block containing ReStructuredText:
   .IP
   .nf
   \f[C]
   .. container:: for-format ms

      .. figure:: davesmapper-2017-04-10-caves-4-numbered.eps
         :alt: Map of Bandit\[aq]s Cave

      Map of Bandit\[aq]s Cave

   \&amp;.. container:: for-format html latex context epub

      .. figure:: davesmapper-2017-04-10-caves-4-numbered.png
         :alt: Map of Bandit\[aq]s Cave

         Map of Bandit\[aq]s Cave
   \f[]
   .fi
   .LP
   How\[aq]s that look?

   </code></pre>

In the first code block you see a lot of HTML spans that look like this:

.. code:: html

   <span id="cb1-3"><a href="#cb1-3"></a>…</span>

They appear to be anchors so you can link to a particular line in the
code block.  When I displayed the HTML file in my browser (Google
Chrome), selected the text, and pasted it into the Gmail message
composition window in the message body area (except for the header
text, which I put in the Subject line text entry box instead) and it
looked fine, so I sent it.

But when I got a reply from someone who uses a `mail user agent`_
that displays the ``text/plain`` alternative that Gmail automatically
creates the supposedly plain text was this:

.. _`mail user agent`: https://en.wikipedia.org/wiki/Email_client

.. code::

   --000000000000360d1105a9a4da6e
   Content-Type: text/plain; charset="UTF-8"

   Here's some ReStructuredText input that has a code block in it:

    <#cb1-1>Missing Ampersand in Code Block -ms output
   <#cb1-2>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ <#cb1-3>
   <#cb1-4>Here's a code block containing ReStructuredText: <#cb1-5>
   <#cb1-6>.. code:: <#cb1-7> <#cb1-8>   .. container:: for-format ms
   <#cb1-9> <#cb1-10>      .. figure::
   davesmapper-2017-04-10-caves-4-numbered.eps <#cb1-11>         :alt:
   Map of Bandit's Cave <#cb1-12> <#cb1-13>      Map of Bandit's Cave
   <#cb1-14> <#cb1-15>   .. container:: for-format html latex context
   epub <#cb1-16> <#cb1-17>      .. figure::
   davesmapper-2017-04-10-caves-4-numbered.png <#cb1-18>         :alt:
   Map of Bandit's Cave <#cb1-19> <#cb1-20>         Map of Bandit's Cave
   <#cb1-21> <#cb1-22>How's that look? <#cb1-23>

   Here's the -ms output from it:

   .SH 1
   Missing Ampersand in Code Block -ms output
   .pdfhref O 1 "Missing Ampersand in Code Block -ms output"
   .pdfhref M "missing-ampersand-in-code-block--ms-output"
   .LP
   Here\[aq]s a code block containing ReStructuredText:
   .IP
   .nf
   \f[C]
   .. container:: for-format ms

      .. figure:: davesmapper-2017-04-10-caves-4-numbered.eps
         :alt: Map of Bandit\[aq]s Cave

      Map of Bandit\[aq]s Cave

   \&.. container:: for-format html latex context epub

      .. figure:: davesmapper-2017-04-10-caves-4-numbered.png
         :alt: Map of Bandit\[aq]s Cave

         Map of Bandit\[aq]s Cave
   \f[]
   .fi
   .LP
   How\[aq]s that look?


   See the first line that starts with .. container::? That line should start
   with \& so it isn't interpreted as an *roff* command. As it is, when you
   build the PDF output from output that line disappears entirely with no
   warning to the user. (The default for *roff* processors like *groff* is to
   ignore unknown commands.)

   See the second line that starts with .. container::? That line *does* start
   with \&. It makes it through fine. The other lines whose first
   non-whitespace character is . make it through fine because to make it a
   *roff* command the first character on the line has to be a period.

   -- 
   T. Kurt Bond, tkurtbond@gmail.com

   --000000000000360d1105a9a4da6e

See the weird psuedo-HTML tags like ``<#cb1-3>`` in the “plain” text
that seems to have resulted from ``<span id="cb1-3"><a
href="#cb1-3"></a>…</span>``?  The person who replied to my message
used the ``text/plain``, and that included all those weird
``<#cbX-Y>`` tags in the plain text reply, which, although they didn't
remark on the oddity, is how I came to know about the problem.

So, one thing to notice is that it was the first code block that was
messed up, and not the second.  It turns out that I specified a
(correct) language for syntax highlighting in the first code block,
``restructuredtext``, and supplied an incorrect language for syntax
highlighting in the second block, ``nroff`` [#pygments-groff]_, which
should have been simply ``roff``.  And it turns out that if I don't
specify a language for the highlighting I don't get the ``<span
id="cb1-3"><a href="#cb1-3"></a></span>`` type output, just a plain
<code> block in a plain <pre> block.

Weird.

(I suppose I could have made this entry shorter and easier to
understand by writing new shorter examples directly using
``.. code::`` directly, but I'm writing about an e-mail that I
actually sent, not a hypothetical e-mail.)

.. [#plain-code-directive]
   I've checked and this weirdness happens with plain ``.. code::``
   directives as well.

.. [#toolong]
   I'm not quoting the whole file because the CSS portion of the
   HTML makes it much too long to quote here.

.. [#pygments-groff]
   Annoyingly, pygments_, which I'm using to write this post for my
   blog, calls that ``groff`` instead of ``roff``, so if I want to turn
   this into a e-mail via the route described here, I'll have to
   change the source file for this.

   
.. _pygments: https://pygments.org/languages/
