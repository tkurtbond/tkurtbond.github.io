.. title: troff Memorandum Macros documentation
.. slug: troff-memorandum-macros-documentation
.. date: 2021-07-15 15:57:09 UTC-04:00
.. tags: troff,xroff,mm,memorandum macros,vms,charon-vax,dwb,documenter's workbench,groff
.. category: computer/document-formatting/troff
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: man
.. |MM| replace:: :app:`mm`
.. |DWB| replace:: :app:`Documenter's Workbench`

**TL;DR:** Look here_ for documentation for the |DWB| |MM| Memorandum
Macros for :app:`groff`.

When I learned :app:`troff` it was actually on a VAX running VMS (used
by `MPL Corporation`_) using a port of :app:`troff` called
:app:`xroff` [#who-produced-xroff]_, probably around 1986.  (The VAX
also had TeX and LaTeX, and I used them too.  Both supported the DEC
LNO3 laserprinter that MPL had.)  While I don't know who produced
:app:`xroff` and can't find anything out about it on the Internet, it
was a complete port of :app:`troff` to VMS, including all the standard
utilities and macro packages, including documentation for :app:`ms`,
:app:`me`, and, significantly for this post |MM|.

.. _MPL Corporation: http://www.mpl.com/

The |MM| documentation was the paper `MM - Memorandum Macros`, by
D\. W. Smith, J. R. Mashey, E. C. Pariser, and N. W. Smith, AT&T Bell
Laboratories, June 1980.  I tried out all the macro packages, but
found |MM| most to my liking.  I think a large part of that was the
|MM| documentation — it described the many features of that macro
package pretty well, in a user guide sort of way, teaching you how to
use the features as it went along, rather than being a pure reference
manual.  And I found |MM| most comparable in features to LaTeX of the
troff macro packages.  While configuring |MM| documents is somewhat
quirky [#quirky]_, I felt that the added features over those found in
:app:`me` and :app:`ms` made it worthwhile.  So I wrote a lot of
documents using |MM|.

Years later when I first got access to :app:`groff` on Unix machines
(early 90s?) the documentation supplied with it for |MM| was the
:man:`groff_mm(7)` man page.  It was very complete as a reference, but
very poor for teaching you how to use |MM|.  I continued to use |MM|
off and on, but I think the lack of the user guide documentation of
the |MM| paper made |MM| less popular among the users of :app:`groff`
than it could have been.  So when modern features for PDF appeared for
groff later on (the :app:`pdfmark` macros), they were adapted to
:app:`ms` but not |MM|.  (:app:`me` was left out, as well.)  I was sad
to see |MM|'s apparently low popularity, and the |MM| paper apparently
is not available on the Internet in a form that copyright allows to be
copied around, unlike the papers on :app:`ms` and :app:`me`, which
come with :app:`groff`.  I suspect this is because |MM| was used
heavily in AT&T's |DWB|, a commercial product that was distributed
separately from UNIX System V, if I understand correctly.

However, eventually the sources to the |DWB| because available under
the Eclipse Public License, and they are available_ in the `n-t-roff`_
github repository (along with `Heirloom Docutils`_, a descendant of
the original :app:`ditroff` with native UTF-8 input and easy use of
fonts).  This includes the source_ to documentation that is derived
from the |MM| paper!  Unfortunately, I haven't been able to find a PDF
of this on the Internet.

I think that having this available might help those who might want to
try out |MM|, or are returning to it after a long break, so I've
posted a version that I built a while ago here_.

As a bonus for reading down this far, here is how I add PDF
outline/table-of-contents entries for sections in :app:`groff` |MM|,
using the ``HZ`` user-defined heading exit macro (see
:man:`groff_mm(7)`):

.. code:: nroff

   .\" pdf outline fold level
   .nr PDFOUTLINE.FOLDLEVEL 3
   .\" start out in outline view
   .pdfview /PageMode /UseOutlines
   .de HZ
   .pdfhref O \\$2 \\*[}0] \\$3
   ..

And here's how to do it in `Heirloom Docutils`_ :app:`troff`:

.. code:: nroff

   .de HY
   .nr HYtmp (\\$1-1)
   \\X'PDFMark: Bookmark \\n[HYtmp] \\$3'
   ..

This version uses the ``HY`` user-defined heading exit macro and
doesn't include the section numbers.

I'm not sure why the two use different macros.  All I can say is that
I wrote them at different times for slightly different purposes.

.. _available: https://github.com/n-t-roff/DWB3.3
.. _n-t-roff: https://github.com/n-t-roff
.. _source: https://github.com/n-t-roff/DWB3.3/tree/master/doc/mm
.. _Heirloom Docutils: http://n-t-roff.github.io/heirloom/doctools.html
.. _here: /troff/mm-all.pdf

.. [#who-produced-xroff]

   While I still maintain a descendant of the VAX I where I used
   :app:`xroff` (emulated using `Charon-VAX`_), sometime in the past the
   :app:`xroff` software disappeared from it.  I have no idea what
   happened to it.  I blame user PDL!

.. [#quirky]

   The page offset, page width, and page length have to be set before
   the |MM| macros were loaded, so while on Unix it is easy to set those
   values on the command line, on VMS due to oddities in its command line
   it was easiest to use ``.so`` and load the macros directly

.. _Charon-VAX: https://www.stromasys.com/solutions/charon-vax/
