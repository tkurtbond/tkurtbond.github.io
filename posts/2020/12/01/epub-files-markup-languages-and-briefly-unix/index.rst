.. title: EPUB files, Markup Languages, and briefly Unix
.. slug: epub-files-markup-languages-and-briefly-unix
.. date: 2020-12-01 15:56:13 UTC-05:00
.. tags: epub,markup languages,lightweight markup languages,unix,troff,latex,context,tex
.. category: computer/markup-languages
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command
.. role:: key

What follows is a lightly edited version (for clarity and relevance)
of the postscripts from an email that I recently wrote, transferred
here for posterity and the general good.

-----

**Danger! Danger Will Robinson! Danger!** The postscripts and
footnotes are much longer than the main body of the reply!  And the
footnotes are longer than the text of the postscripts!

**P.S**. H., P. (and H. M., if you are interested, though I
admit this combines some of my more geeky interests and thus may be of
less interest to all of you, or for Howard and Paul, for that matter):

I actually figured out how to make ebooks (to a limited degree)
because I wanted to try an ebook I made of an RPG adventure I wrote
for a currently on hiatus\ [0]_ fantasy `Savage Worlds
<https://en.wikipedia.org/wiki/Savage_Worlds>`__ roleplaying game
campaign for my daughter `Lily
<https://www.facebook.com/lily.bond.31>`__ and my `niece
<https://www.facebook.com/eva.atha.7>`__ and nephews (`N1
<https://www.facebook.com/mason.atha.7>`__). I originally wrote the
adventure\ [1]_ in three typesetting systems which use `markup
languages <https://en.wikipedia.org/wiki/Markup_language>`__, `LaTeX
<https://en.wikipedia.org/wiki/LaTeX>`__, `ConTeXt
<https://en.wikipedia.org/wiki/ConTeXt>`__, and `troff
<https://troff.org/>`__\ [2]_ (which I usually use in its guise as
GNU_ `groff <https://www.gnu.org/software/groff/>`__, but this time I
used :app:`Heirloom troff`, part of the `Heirloom Documentation
Tools`_, for its easy access to modern fonts) to compare the markup
languages and their PDF output to decide which one I prefered to
use. Later I converted it to `ReStructuredText
<https://docutils.sourceforge.io/rst.html>`__, a lightweight markup
language\ [3]_ that I use, to compare it to the other markup
languages.

I have used ReStructuredText on and off for many years, but the main
drawbacks to it was that (1) the output produced by its original
`docutils <https://docutils.sourceforge.io/>`__ implementation was
excessively stark and difficult to customize to have a nicer
appearance, and (2) its workflow was somewhat difficult,\ [4]_ Some
time ago I discovered `Pandoc <https://pandoc.org/>`__, a “universal
document converter” which can read many input sources, including
ReStructuredText, and produce output in many output formats, including
PDF (via :app:`LaTeX`, :app:`ConTeXt`, or :app:`troff`; in ways easier
to customize the appearance of) and HTML, and, as it turns and
importantly to this story, EPUB, the most common format for ebooks! I
started using :app:`Pandoc` because it made it easier to generate PDF from
ReStructuredText with one command (since :app:`Pandoc` runs all the
intermediate steps and cleans up any temporary files needed). It
turned out that the abilities to read multiple input formats and to
more easily customize the output was important to me as well.

So, having converted the adventure over to ReStructuredTexT for
comparison\ [5]_ and at first using PDF through :app:`Pandoc`\ 's
``troff -ms`` output, I soon decided to take a look at :app:`Pandoc`\ 's other
output formats. I started with :app:`LaTeX` and :app:`ConTeXt`, and decided that the
PDF output via :app:`LaTeX` was not of much interest to me, but the PDF
output via :app:`ConTeXt` offered greater control over the appearance of the
final PDF output and the opportunity of adding via writing Lua filters
some features to the resulting documents that lightweight markup
languages normally don't offer, such as indexes and cross references
that are both hyperlinks and include page numbers and section names in
the PDF output, which are features that I didn't need in the adventure
document, but which I expect to need in future documents.

But back to the important point, :app:`Pandoc` can produce EBUB output for
ebooks!  Since I already had the adventure in ReStructuredText, and
:app:`Pandoc` produces EPUB, and I have an ebook reader, a Kindle, it just
makes sense to figure out how to get it onto my Kindle! First I used
:app:`Pandoc` to generate the EPUB. That required figuring out how to
generate a reasonably attractive cover. Then wrote a small config file
for :app:`Pandoc`.  Then I generated the EPUB output. Then I figured out how
to convert that over to MOBI, one of the formats that the Kindle can
use.\ [6]_ Then I mailed it to my Kindle's email, and it looked
reasonably good!\ [7]_

I hope you've enjoyed this twisty maze of passages, all different!

And with a `Zork <https://en.wikipedia.org/wiki/Zork>`__ reference I
really must end this email!

.. [0] Pandemics are no fun!

   I originally thought I'd get through this email without footnotes, but
   `needs must when the devil
   drives <https://www.worldwidewords.org/qa/qa-nee1.htm>`__. I rather
   enjoy footnotes in email messages, but it's not as convenient in gmail
   as it used to be in Emacs. And since it offered the opportunity for a
   Shakespeare reference of sorts, I'm quite pleased, in general.

.. [1] As it turns out, I actually wrote **seven** Savage Worlds
   adventures in :app:`troff`, and then converted them all to
   :app:`LaTeX` and :app:`ConTeXt` for comparison later. I actually
   wrote the first **three** adventures using `LibreOffice
   <https://www.libreoffice.org/>`__, a conventional office suite with
   a word processor, something I normally dislike but was giving
   another chance. I decided after three adventures that I wasn't
   going to do another in :app:`LibreOffice`, and started looking for
   alternatives, hence comparing markup languages. I tend to like
   markup languages better than WYSIWYG_ editors; this may just be the
   programmer in me liking the idea of languages over WYSIWYG, but
   there did turn out to be significant advantages to switching to a
   markup language in the end. The primary one was that I could put
   character and creature descriptions in external files and reference
   them in the main file, rather than cut and paste them from one
   document to another, which meant I could just change the external
   file and it would automatically be included in the updated document
   next time I generated output from it. With a WYSIWYG tool I'd have
   had to go back and cut and paste the changed material in every
   document every time I changed it, which would be immensely tedious
   and horribly error prone and all too common.

.. [2] This footnote is about :app:`LaTeX`, :app:`ConTeXt`, and
   :app:`troff`, and peripherally about `TeX
   <https://en.wikipedia.org/wiki/TeX>`__, the progenitor of
   :app:`LaTeX` and :app:`ConTeXt`. :app:`Troff` was one of the
   earliest computer typesetting systems, invented in 1973 as a scheme
   at the computer science portion of Bell Labs to get a PDP-11 so
   they could have an `time-sharing
   <https://en.wikipedia.org/wiki/Time-sharing>`_ operating system,
   like the earlier `Multics
   <https://en.wikipedia.org/wiki/Multics>`__ that ran on much more
   expensive hardware and that the researchers had worked on
   previously and looked back fondly after Bell Labs pulled out of
   that research. Bell Labs wouldn't just pay for a computer for the
   researchers to play with, so they proposed developing a computer
   typesetting system for the secretaries to use, largely for patent
   submission, something Bell Labs did a lot of. Their scheme
   succeeded and as a result they invented Unix and :app:`troff`.

   So, Unix was invented **explicitly** to run :app:`troff`!

   :app:`TeX`, by contrast, was not invented until 1978, :app:`LaTeX` in
   1985, and `ConTeXt` not until 1990! (I wish I'd found out about the
   latter earlier!)  :app:`TeX` was invented because of `Donald
   Knuth`_\ 's desire to produce gloriously typeset books with
   mathematics for his multi-volume work `The Art of Computer
   Programming
   <https://en.wikipedia.org/wiki/The_Art_of_Computer_Programming>`_.
   He finished :app:`TeX` long ago, but is still working on those
   books.

   All of these typesetting systems have what are called markup
   languages, where the text of the document is interspersed with
   commands distinguished in some way from the regular text. For
   instance, the command ``\begin{document}`` from :app:`LaTeX` is
   typical of :app:`TeX`, :app:`LaTeX`, and :app:`ConTeXt`, all of
   which are related. :app:`Troff` uses backslash commands in the
   middle of text and and commands on separate lines starting with
   periods but historically those commands have been limited to names
   of two characters, though this was relaxed in the later
   :app:`troff` implementation :app:`groff`, and in the :app:`Heirloom
   troff` implementation
   which extended the second :app:`troff` implementation,
   :app:`ditroff`, with similar features as gnu groff, but easier
   access to modern fonts.

   I am particularly impressed by :app:`troff`\ 's ability to
   correctly typeset documents that I wrote 30 years ago and that
   others have written even earlier. It has never failed me in this
   task.† This has often been a problem for me with documents from
   WYSIWYG systems on the contrary, even when those documents were
   more recently created, including one significant one
   from 2004. (`Star Office
   <https://en.wikipedia.org/wiki/StarOffice>`__, I'm looking at
   you!‡). :app:`LaTeX` is reasonably backward compatible, though it
   did go through some big changes earlier it is now mostly stable. I
   did experience some compatibility problems, minor with my documents
   and major with complicated documents written by others.
   :app:`ConTeXt` is generally stable, but it is developing rapidly so
   has more changes, though the developers are good about backward
   compatibility. The increasing sophistication of :app:`ConTeXt`,
   which along its development has subsumed both :app:`TeX` and
   MetaPost_ and combined and extended them with the Lua scripting
   language (mentioned again below), producing something that is even
   more flexible and impressive than :app:`TeX` and :app:`LaTeX`.

   Another thing I like about markup languages is the fact that they
   are `plain text`_\ ‖, and can be manipulated with any program you
   want. Before the emergence of XML_\ -based WYSIWYG document formats
   in :app:`Microsoft Word`\ § and :app:`Star Office` this was
   practically impossible. Even now the complexity of the ZIP file and
   XML markup renders this much much more unpleasant to deal
   with. Kicking dead whales down the beach indeed! Being able to use
   any tool at all on a document is considerably more useful than
   being limited to the poor extensions languages of :app:`Microsoft
   Word` and :app:`LibreOffice`, and usually much simpler.

   † I **have** had to change a few external programs I've written to
   help in the build process. Perl_ was a problem here. (I tried to resist
   the footnote within the footnote, but again, need must when the devil
   drives.)

   ‡ Sure, the current :app:`LibreOffice` will open the file, but the
   formatting is significantly messed up.  Earlier versions, if I
   remember correctly, did not open the file correctly.

   § I have never written a document in :app:`Microsoft Word` for my
   personal use, though unfortunately I have used it often at work.

   ‖ I have delightedly taken to using Unicode characters in my plain text
   documents, as the ReStructuredText source of this document shows.

.. [3] Lightweight markup languages, in contrast with :app:`TeX`,
   :app:`LaTeX`, :app:`ConTeXt`, and :app:`troff`, are usually things
   that start with the conventions like indicating \*italics\* by
   surrounding phrases in plain text email messages and USENET_ posts
   around them in the olden days. Most of them avoid the use of lots
   of keywords and backslashes, of the sort :app:`TeX`, :app:`LaTeX`,
   :app:`ConTeXt`, and to a partial extent :app:`troff` use. Instead,
   they largely try to use the non-alphanumeric characters on a
   standard keyboard to indicate how the text should be typeset, and
   without using long command names. The lack of these long command
   names (or short ones in :app:`troff`\ 's case) and the relatively
   unobtrusive nature of the non-alphanumeric characters makes
   documents easier to read. This is why they are called “lightweight”
   markup languages. `Wikipedia
   <http://Lightweight_markup_language>`__ has a good article that
   explains and compares them. Another advantage of most lightweight
   markup languages is that since they don't generally use command
   names, native speakers of languages other than English don't have
   to learn English command names, a significant matter.

   I happen to prefer ReStructuredText, but Markdown is another very
   popular lightweight markup language that I sometimes use.

   Another advantage to lightweight markup languages such as
   ReStructuredText and Markdown is that they often have programs allowing
   multiple kinds of output from them (PDF and HTML are typical) and since
   lightweight markup languages make no pretensions to being programming
   languages, which the markup languages of the original typesetting
   systems do (since that was how they allowed customization and
   extension), writing the programs to output multiple output types for
   lightweight markup languages is simpler than than writing programs to
   parse the heavy markup languages, which is the common approach that
   people take to get HTML from :app:`LaTeX`, for instance. The fact that heavy
   markup languages are usually `Turing
   complete <https://en.wikipedia.org/wiki/Turing_completeness>`__ and so
   can be extensively (and definitely are in practice) extended and often
   have programmable syntax makes processing them with other tools
   difficult and usually require much hand conversion. It is my impression
   that while :app:`LaTeX` to HTML translators like
   `TeXht <https://tug.org/tex4ht/>`__ and
   `HEVEA <http://hevea.inria.fr/>`__ are very good for documents that only
   use the standard features of :app:`LaTeX` they can't deal easily with heavily
   programmed documents, since that would require more semantic
   understanding of the original :app:`LaTeX` source.

   One interesting attempt in this direction for :app:`troff` was the `unroff
   <http://www-rn.informatik.uni-bremen.de/software/unroff/>`__
   program, written in `Elk Scheme <http://sam.zoy.org/elk/>`__. It
   took the approach of implementing a complete :app:`troff` parser and
   proving Scheme as an extension language so you could completely
   customize the output.  It provided a complete implementation for
   the ``troff -ms`` macros, and I was easily able to extend those to
   handle cross references and indexes that I had extended that :app:`troff`
   document's build process to provide, in 170 lines of Scheme.

.. [4] In particular, there was no standard name for the commands used
   to generate various kinds of output; on some operating systems it
   was rst2latex, and on others it was rst2latex.py. Also, the
   :app:`docutils` toolchain for producing PDF output generated
   intermediate :app:`LaTeX` files which necessitated processing with
   further tools, which usually necessitated writing a `Makefile
   <https://en.wikipedia.org/wiki/Makefile>`__ so I didn't have to
   retype multiple commands whenever I regenerated the output
   document. For a simple document that was considerable hassle and
   overhead, even when worth it for a more complicated
   document. (Makefiles are well worth it for complicated documents
   with complicated build processes, of course.  I have lots of those.)

.. [5] As a result of the comparison, I decided that I greatly
   prefered ReStructuredText and :app:`pandoc` for the tool to process
   it. :app:`Pandoc`\ 's ability to customize its output using
   `filters <https://pandoc.org/lua-filters.html>`__ written in the
   programming language `Lua <https://www.lua.org/>`__ was
   particularly appealing, as was the ability to customize its default
   templates for generating output using the ``troff -ms`` macros and
   :app:`ConTeXt`. I see a use for both of those, since the -ms output
   is easier to customize for things that the base -ms provides, but
   the :app:`ConTeXt` output offers greater control over the final
   appearance, though often at the cost of greater effort. For
   instance, I have a moderately long document† that is currently in
   `DocBook <https://docbook.org/>`__ 5.0 XML format, and I now find
   it tedious to edit and the open source tool for generating PDF from
   it has serious flaws. (I'm resisting another footnote in a
   footnote. Be impressed that I succeeded!) I can see how I can
   convert it to ReStructuredText (or Markdown, for that matter) and
   use :app:`Pandoc`\ 's :app:`ConTeXt` output to produce a nicer, more
   attractive PDF. Now I just need the time to write the lua filter
   and do the conversion. (:app:`Pandoc` will convert it from DocBook, but
   will lose the indexing information, which I would have to do all
   over again, a task with more work than I want to contemplate at the
   moment.)

   I still find uses for :app:`troff` and :app:`ConTeXt`. In
   particular, if I have to use complicated tables in a document I
   find that the either :app:`troff` or :app:`ConTeXt` works
   better. (Simple tables for either are OK from ReStructuredText
   output, but complicated ones…!)

   † The DocBook version of the document was derived from the ``troff -ms``
   source mentioned previously, though by the time the
   conversion happened I vaguely recall I no longer had access to a working
   :app:`unroff`, I think because of bitrot_. NetBSD_ has an :app:`unroff`
   `package <https://pkgsrc.se/textproc/unroff>`__ in its pkgsrc
   collection of program, and I could install it now on my NetBSD
   machine, but when I tried to process the document :app:`unroff` exited
   complaining about a syntax error in one of its Scheme files. So bitrot
   seems to prevail.

.. [6] Using an open source command line utility provided with
   `Calibre <https://calibre-ebook.com/>`__ ebook reader, of course!

.. [7] There are some oddities in the current build with the conversion to
   mobi complaining about fonts not being found in the right places and
   being deleted from the result, but I don't know enough about ebooks to
   debug it at this time. Besides, I've hit the auspicious footnote number
   seven (though it's not the seventh footnote, as it is actually the
   eighth!) and should really finish this email now.

**P.P.S.** *Omitted for irrelevance*.

**P.P.P.S.** Sorry, no deeply nested parenthetical expressions this
time!

-----

Here's an addendum with two Apple :app:`Messenger` messages to P.,
reflecting on converting this from an HTML email into a blog post:

The HTML dialect Google uses in its MIME emails is very odd.  It
doesn’t use ``<p>`` elements, using instead ``<div>`` elements.
Unfortunately, :app:`pandoc` converts those into containers, and nests
them according to the nesting of the ``<div>`` elements.  To fix this
I hand edited the HTML to remove the outer ``<div>`` elements and
convert the remaining ones into <p>s.  Also, for some reason when I
ran the documents through HTML tidy it converted the unicode
characters into incorrect HTML character entities.  I see now that it
has a ``-utf8`` switch, which I’ll have to remember for the next time
I do this.  (There will inevitably be a next time.)

OMG, now I have have to put that in the blog post!  How many `saving
throws`_ am I going to fail today anyway?


.. _WYSIWYG: https://en.wikipedia.org/wiki/WYSIWYG
.. _XML: https://en.wikipedia.org/wiki/XML
.. _Perl: https://www.perl.org/
.. _bitrot: https://en.wikipedia.org/wiki/Software_rot
.. _Donald Knuth: https://en.wikipedia.org/wiki/Donald_Knuth
.. _plain text: https://en.wikipedia.org/wiki/Plain_text
.. _USENET: https://en.wikipedia.org/wiki/Usenet
.. _MetaPost: https://en.wikipedia.org/wiki/MetaPost
.. _GNU: https://en.wikipedia.org/wiki/GNU
.. _Heirloom Documentation Tools: http://n-t-roff.github.io/heirloom/doctools.html
.. _NetBSD: http://netbsd.org/
.. _Saving Throws: https://en.wikipedia.org/wiki/Saving_throw


*Last edited: 2020-12-28 11:11:54 EST*

..
   Local Variables:
   time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
