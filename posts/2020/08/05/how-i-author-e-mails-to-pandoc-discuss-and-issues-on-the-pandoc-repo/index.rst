.. title: How I author e-mails to pandoc-discuss and issues on the pandoc repo
.. slug: how-i-author-e-mails-to-pandoc-discuss-and-issues-on-the-pandoc-repo
.. date: 2020-08-05 14:40:53 UTC-04:00
.. tags: pandoc,issues,pandoc-discuss,restructuredtext,rst,gfm,github flavored markdown
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: program
.. role:: file

To submit an issue to the pandoc_ GitHub repository_ or an e-mail to
the `pandoc-discuss`_ Google group when it is complicated I write a
reStructuredText (reST_) file that shows the problem and a reST_ file
that explains the problem that prompted the issue/e-mail and include
the pandoc and os version information and includes the problem reST_
file and sometimes the resulting output files.  I process these files
with pandoc_, of course.  If it is going to the mailing list I format
it to HTML with a fancy style and cut and paste it from Chrome into
gmail.  If it is going to be an issue report on GitHub I format it
into :file:`.gfm` (Github Flavored Markdown: GFM_) file because that’s
what you write GitHub issues in and also format it into HTML to check
that the :file:`.gfm` is formed properly.  Typically when I’m writing the
issue reST_ file I don’t use language names on code blocks for the
syntax highlighting because that doesn’t seem to come out right in
GFM.

.. _pandoc: https://pandoc.org
.. _repository: https://github.com/jgm/pandoc
.. _pandoc-discuss: https://groups.google.com/forum/#!forum/pandoc-discuss
.. _reST: https://docutils.sourceforge.io/rst.html
.. _GFM: https://github.github.com/gfm/

For example, here is a post_, “RST to RST Conversion Loses Interpreted
Text Roles”, to `pandoc-discuss`_.

.. _post: https://groups.google.com/d/msg/pandoc-discuss/U44h5Uo7qgQ/xDBRWwERBAAJ

Here is the problem reST_ source:

.. code:: ReST

   RST to RST Conversion Looses Interpreted Text Roles
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   .. role:: app

   :app:`GNU Emacs` is an app.  So is :app:`Eclipse`.

Here is the e-mail reST_ source:

.. code:: ReST

   RST to RST Conversion Loses Interpreted Text Roles
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   .. role:: file(literal)
   .. role:: app

   It turns out that when you use :app:`pandoc` to convert from ``rst``
   to ``rst`` the process loses interpreted text roles.

   My :app:`pandoc` version is:

   .. include:: pandoc.version
      :code:

   My OS information is:

   .. include:: os.version
      :code:

   I generated the outputs to check with the following commands:

   .. code::

      pandoc -r rst -w rst -o r2rclitr-out.rst r2rclitr-in.rst
      pandoc -r rst -w native --output=r2rclitr-in.native r2rclitr-in.rst

   So, for the ReStructuredText input (file :file:`r2rclitr-in.rst`):

   .. include:: r2rclitr-in.rst
      :code:

   the resulting ``rst`` output (:file:`r2rclitr-out.rst`) is generated:

   .. include:: r2rclitr-out.rst
      :code:

   And the ``native`` output (:file:`r2rclitr-in.native`) generated:

   .. include:: r2rclitr-in.native
      :code:

   has ``Span`` elements with classes, so it should be possible to turn
   those back into interpreted text roles in ``rst`` output.  I suppose
   you'd have to write out at the beginning of the RST output file a list
   of

   .. code::

      .. role:: rolename

   lines for every class ``rolename`` in a span.  Would this be possible?

Here is the :file:`GNUmakefile` for it:

.. code:: makefile

   all:	r2rclitr-email.html

   r2rclitr-email.html: pandoc.version os.version pandoc.style \
           r2rclitr-in.rst r2rclitr-out.rst  r2rclitr-in.native

   pandoc.version: $(shell type -p pandoc)
           pandoc --version | head -2 >$@
   os.version:
           osinfo >$@

   # ReST input
   %-out.rst: %-in.rst
           pandoc -r rst -w rst -o $@ $<
   %.html : %.rst
           pandoc -r rst -w html --include-in-header=pandoc.style --output=$@ $<
   %.native : %.rst
           pandoc -r rst -w native --output=$@ $<

   .PHONY: clean

   clean: 
           -rm *.pdf *.html *.ms *.ctx *.ltx *.native os.version *-out.rst

When I'm doing an issue the result is a GFM_ file that I can cut and
paste into the editor used for issues on GitHub, which expects GFM_.
I write it in reST_ because that can include files and processing from
reST_ to GFM_ does the inclusion, so I don't have to do it by hand.


Here's an example issue_, "Reference Not Found Error #6592" on the
pandoc repository_.

.. _issue: https://github.com/jgm/pandoc/issues/6592

The problem reST_ file :file:`rnf.rst` is

.. code:: ReST

   ​﻿   **Option:** Arachnaurs' webs are made with a neurotoxin_ that can
   ​   quickly paralyze their prey!  When wrapped in a web, make a Vigor
   ​   roll or quickly lose consciousness.

      .. _neurotoxin: https://www.sciencenews.org/article/spiders-poisonous-webs-neuro-toxins-genes

(The contents of the actual file are all indented 3 spaces, but I had
to prefix all the lines in the code block in this source with the
Unicode `ZERO WIDTH SPACE`_ so the indentation would show.)

.. _ZERO WIDTH SPACE: https://en.wikipedia.org/wiki/Zero-width_space

The issue reST_ file :file:`rnf-issue.rst` is

.. code:: ReST

   Reference Not Found Error
   @@@@@@@@@@@@@@@@@@@@@@@@@

   When I process the following reST file (notice it the whole file is
   indented 3 spaces)

   .. include:: rnf.rst
      :code:

   into ``ms`` or PDF via ``ms`` output with the command

   .. code::

      pandoc -s -r rst -w ms -o rnf.ms.pdf rnf.rst


   I get the errors

   .. code::

      [WARNING] Reference not found for 'neurotoxin' at chunk line 1 column 57
      <standard input>:70: macro error: pdfhref has no destination

   and the resulting output PDF file and ``.ms`` file indeed do not
   have the link.

   Here's the ``.ms`` file that was generated:

   .. include:: rnf.ms
      :code:

   I'm using the following version of Pandoc:

   .. include:: pandoc.version
      :code:

   My OS information is:

   .. include:: os.version
      :code:


The generated GFM_ is

.. code::

   Reference Not Found Error
   =========================

   When I process the following reST file (notice it the whole file is
   indented 3 spaces)

          **Option:** Arachnaurs' webs are made with a neurotoxin_ that can
          quickly paralyze their prey!  When wrapped in a web, make a Vigor
          roll or quickly lose consciousness.

          .. _neurotoxin: https://www.sciencenews.org/article/spiders-poisonous-webs-neuro-toxins-genes

   into `ms` or PDF via `ms` output with the command

       pandoc -s -r rst -w ms -o rnf.ms.pdf rnf.rst

   I get the errors

       [WARNING] Reference not found for 'neurotoxin' at chunk line 1 column 57
       <standard input>:70: macro error: pdfhref has no destination

   and the resulting output PDF file and `.ms` file indeed do not have the
   link.

   Here's the `.ms` file that was generated:

       .QS
       .LP
       \f[B]Option:\f[R] Arachnaurs\[aq] webs are made with a \c
       .pdfhref W -D "" -A "\c" \
        -- "neurotoxin"
       \& that can quickly paralyze their prey! When wrapped in a web, make a
       Vigor roll or quickly lose consciousness.
       .QE

   I'm using the following version of Pandoc:

       pandoc 2.10.1
       Compiled with pandoc-types 1.21, texmath 0.12.0.2, skylighting 0.8.5

   My OS information is:

       Mac OS X, Version 10.15.6, Build 19G73

Here is the :file:`GNUmakefile` for it:

.. code:: makefile
          
   all:	rnf-issue.gfm rnf-issue.html rnf-issue.gfm.html rnf.ms.pdf rnf.ms

   rnf-issue.html rnf-issue.gfm rnf-issue.gfm.html: rnf.rst \
           pandoc.version os.version

   .PRECIOUS: rnf-issue.gfm


   pandoc.version: $(shell type -p pandoc)
           pandoc --version | head -2 >$@
   os.version:
           osinfo >$@

   %.ms : %.rst
           pandoc -r rst -w ms -o $@ $<

   %.ms.pdf : %.rst
           pandoc -s -r rst -w ms -o $@ $<

   %.html : %.rst
           pandoc -s -r rst -w html -H fancy.style --output=$@ $<

   %-pandoc.html : %.rst
           pandoc -r rst -w html --output=$@ $<

   %-docutils.html: %.rst
           rst2html.py $< | sed '1,/^<div class="document">/d' | sed -e '1,2d' -e '\%</div>%,$$d' >$@

   %.gfm : %.rst
           pandoc -r rst -w gfm -o $@ $<

   %.gfm.html : %.gfm
           pandoc -s -r gfm -w html -H fancy.style -o $@ $<

   .PHONY: clean

   clean: 
           -rm *.html *.native os.version pandoc.version docutils.version *.gfm

   .depend: rnf-issue.rst
           rst-depends rnf-issue.rst >$@

   include .depend


This may seem complex, but in practice I use templates to start out
all the files and by building it all with :program:`make` and pandoc_
using the ``include`` directive of reST_ I ensure that the contents of
the message are correctly built from the various included files.
