.. title: Overcoming reST's limited table control by including raw groff TBL
.. slug: overcoming-rests-limited-table-control-by-including-raw-groff-tbl
.. date: 2023-02-03 08:31:34 UTC-05:00
.. tags: rest,restructuredtext,docutils,groff,pandoc,context,html,yaml,rpg,besm 4e,big eyes small mouth,besm
.. category: computer/markup-and-formatting
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: series
.. role:: title
.. role:: command

So.  I have a CHICKEN Scheme program that converts `Big Eyes Small
Mouth 4E`__ characters from a YAML definition into reStructuredText_
(reST).

__ http://dyskami.ca/besm.html
.. _reStructuredText: https://docutils.sourceforge.io/rst.html

Unfortunately, pandoc_’s  (and probably the orginal python docutils_’),
formatting of tables is limited and doesn’t let me do what I need to
do.

.. _pandoc: https://pandoc.org/
.. _docutils: https://docutils.sourceforge.io/

Here’s an image of the BESM 4E character, Xeksil [#xeksil]_, I played
last night:

.. image:: /images/xeksil-plain-rst-version.png
   :alt: Original charactersheet for Xeksil in :app:`reST` using grid tables

As you can see, it doesn’t fully fill the width of the page, and the
first two columns are two wide for the information they contain.

I’m contemplating changing the program so that the actual tables are
in groff_ :app:`tbl` format directly, and insert them into the
generated :app:`reST` file in ``.. raw:: ms`` directives.  That locks
me into using :app:`pandoc`’s :app:`groff` :app:`ms` macros output, but I
could just write a new version that outputs ConTeXt (C1_, C2_) if I
ever need one…

.. _groff: https://www.gnu.org/software/groff/
.. _C1: https://en.wikipedia.org/wiki/ConTeXt
.. _C2: https://wiki.contextgarden.net/Main_Page

As a test, I converted a character and his mecha into raw :app:`groff`
:app:`ms` with :app:`tbl` output.  Here’s an image of that:

.. image:: /images/enyon-in-groff-ms-directly.png
   :alt: Test character sheet for Enyon Boase in plain groff -ms with TBL.

As you can see, the tables fill the width of the text entirely and the
first two columns are narrower and the third column expands to fill
the width of the text.  I was also able to put double lines before and
after each entity, and put single lines after the headers and before
the total lines.

I think this looks much better.

Note that the first example is on 5.5” by 8.5” page (which I use for
things I’m going to look at on the screen a lot, because it takes up
less space) and the second example is on 8.5” by 11” paper and in two
columns.  It was essentially impossible to have :app:`pandoc` (and I’m
sure docutils) produce 2 column output and have the :app:`reST`
versions of the tables adapt to the width of the columns.  With the
narrower widths of the first two table columns the third table column
is wide enough that I can use pages with two columns.

CPB (who I talked about this with earlier) commented: The data is in
YAML now right?  Why not just generate troff?

Because when I write the actual text of things, I prefer :app:`reST`.
So, for instance, the description of the character or entity I write
in :app:`reST`.  And I like :app:`reST` for the main documents into
which I include these generated files because then I can output to
HTML too.  (Or to ConTexT; I’ve got some documents where I needed
features that ConTexT has and :app:`pandoc`’s groff -ms output doesn’t
have.)

I’ve already written the character formatting program (named
:command:`besm-rst`, originally enough) so that it can output the
table version or a terse version where the different sections are in
normal paragraphs, which is useful because it is much more compact.
Adding a version that outputs :app:`reST` with tables expressed as an
:app:`reST` ``.. raw:: ms`` block that contains the table sections as
:app:`groff -ms` :app:`tbl` source would just be writing another
version of the output routine, selectable with a command line option.

The original output routine to produce :app:`reST` grid tables and its
support procedures were 315 lines.  The second output routine to
paragraphs and its new support procedures (it uses some of the first
output routine’s support procedures) was 158 lines.

It will be interesting to see how long the troff output will be.

Oh, here is Lieutenant Enyon Boase again, this time in paragraph format:

.. image:: /images/enyon-terse-plain-rst-version.png

That’s also a 8.5” by 11” page, and as you can see, it’s much more
compact, but harder for folks to find each individual item.  This is
basically the format that was used in the original BESM 1E and 2E
books, and the table based version appeared in BESM 3E and was
continued in 4E.

I think the table format is much easier to read.

Now, when I use the :app:`reST` table output and generate HTML from it
it looks kinda crude:

.. image:: /images/enyon-rst-grid-table-html-output.png
   :alt: Character sheet for Enyon Boase using reST grid tables for
         HTML output.

However, I think I may be able to fix that with CSS.

The HTML is relatively clean.  (It probably doesn't really need the
width specifications in the colgroup element, but :app:`pandoc` puts
those in.)

That’s actually six tables.  If I wrap them in one div with a
particular class I think I can get them formatted right.

CPB commented: CSS supports printing.

Yes, there is actually at least one commercial document formatting
system that uses CSS for sophisticated print output, much more
elaborate than what the browsers support, I think.

But I know :app:`tbl` better than CSS. 😉

I do have a need for good looking output html for the output of the
program: so I can put it on my blog!  It would be better than images
in cases where I’m not actually comparing the PDF output of various
things.

Well, it took me longer that I expected, 4¼ hours.  After the first 2
hours I was fried (it had been a long day): if I had stopped then I
probably could have finished it the next day in an hour.  Oh well.
The new output routine and its new supporting routines were 208 lines
long.

Here's an image of the page produced (probably from same YAML file; I
have a couple, since one of them was an early test file for
:command:`besm-rst`.)  using the new output routine, with :app:`reST`
output with :app:`tbl` output in ``.. raw:: ms``, pulled from the
document with all the pregenerated characters:

.. image:: /images/enyon-boase-rst-output-with-raw-ms-tbl.png
   :alt: Enyon Boase reST output with tbl in raw ms block

And for reference, here is the YAML version of Enyon Boase:

.. include:: files/markup-and-formatting/enyon-boase.yaml
   :code: yaml

And here is the YAML version of his FV2021 Coleopteran:

.. include:: files/markup-and-formatting/FV2021-Coleopteran.yaml
   :code: yaml

The git repo with this program and some test data is on github_.

.. _github: https://github.com/tkurtbond/besm-tools
          
Enyon Boase is a pregenerated character that I came up for the
:title:`BESM 4E` rewrite of the :title:`BESM 1E` adventure “Red
Planet, Blue Helmets”, from :title:`Big Robots, Cool Starships`.  The
FV2021 Coleopteran is also from that adventure.

.. [#xeksil] Xeksil has the “Dimension Walk” attribute.  In the
   backstory in my head he's the son of a woman from the Courts of
   Chaos (from Zelazny's :series:`Amber Chronicles`) and a man that at
   least *looks* human (but may not be; I haven't decided yet), so for
   Xeksil this ability is “Shadow Shifting”.

..
   Why does the footnote in this link

       http://0.0.0.0:8000/posts/2023/02/03/overcoming-rests-limited-table-control-by-including-raw-groff-tbl/#xeksil

   have the square brackets around it and is a span element before a p
   element, while the one in

       http://0.0.0.0:8000/posts/2020/11/29/looking-at-the-mini-six-rpg-and-related-games/#id1

   doesn't and is in a dl element?
