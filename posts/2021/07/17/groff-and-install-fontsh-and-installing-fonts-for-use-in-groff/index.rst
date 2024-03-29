.. title: groff and install-font.sh and installing fonts for use in groff
.. slug: groff-and-install-fontsh-and-installing-fonts-for-use-in-groff
.. date: 2021-07-17 00:16:49 UTC-04:00
.. tags: groff,mom,install-font.sh,fonts,troff
.. category: computer/documents
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: command
.. role:: file

.. note::

   This was originally a post_ to the groff_ `mailing list`_.  It has
   been slightly modified.

   .. _post: https://lists.gnu.org/archive/html/groff/2021-07/msg00089.html
   .. _groff: https://www.gnu.org/software/groff/
   .. _mailing list: https://lists.gnu.org/mailman/listinfo/groff/

Currently :command:`install-font.sh` is not part of :app:`groff`.
We've had some discussion on the list recently_ and in the past about
integrating it into the :app:`groff` distribution, and in response to
recent discussion_ there is a new bug, `#60930
<https://savannah.gnu.org/bugs/index.php?60930>`__, requesting
integrating it, including documentation, etc.

.. _recently: https://lists.gnu.org/archive/html/groff/2021-07/msg00061.html
.. _discussion: https://lists.gnu.org/archive/html/groff/2021-07/msg00054.html

In the meantime, if you want to install fonts in OpenType or TrueType
formats for use with ``devps`` and ``devpdf``,
:command:`install-font.sh` greatly simplifies the process.

The :command:`install-font.sh` script was written by Peter Schaffter, the author
of the `mom macros <https://www.schaffter.ca/mom/mom-01.html>`__ for
:app:`groff`, and is distributed on mom's `download page
<https://www.schaffter.ca/mom/mom-05.html#install-font>`__ and can be
downloaded `directly
<https://www.schaffter.ca/mom/bin/install-font.sh>`__.  It has a ``-H``
option that prints the documentation for it.

`Fontforge <https://fontforge.org/>`__ is a free and open source font
editor.  It can run scripts to manipulate fonts and convert between
font formats.  (I only use :app:`fontforge` to install fonts with
:command:`install-font.sh`, so I use a version that is command line
only, but the normal build has a GUI for interactively building
fonts.)  The :command:`install-font.sh` script uses :app:`Fontforge` to convert
OpenType and TrueType fonts to PostScript Type42 (:file:`.t42`) and Type1
(:file:`.pfa`), from which a :app:`groff` font is generated by the
:app:`groff` utility :command:`afmtodit`.  Then the necessary files are moved to
:file:`site-font/devps` and registered in its download file for use by :command:`grops`.
Optionally the same can be done for :file:`site-font/devpdf` for the use of
:file:`gropdf`.  Then the fonts are available for use by ``groff
-Tps`` and ``groff -Tpdf``.

So, suppose you wanted to use `Cormorant Garamond
<https://fonts.google.com/specimen/Cormorant+Garamond>`__, a free
font.  You could download the Regular, Italic, Bold, and Bold Italic
variants of the font, since :app:`groff` tends to expect there to be
R, I, B, and BI variants of the fonts it uses, though that is not
mandatory.  This would give you the files
:file:`CormorantGaramond-Regular.ttf`,
:file:`CormorantGaramond-Italic.ttf`,
:file:`CormorantGaramond-Bold.ttf`, and
:file:`CormorantGaramond-BoldItalic.ttf`.  You would then use
:command:`install-font.sh` to convert them and install the resulting
files into proper places under :app:`groff`'s site-font directory.

So, for instance, you'd cd to the directory that holds the :file:`.ttf` files
you downloaded.  Then, to install the Regular variant of Cormorant
Garamond you'd run the command

.. code:: bash

    $(IFDIR)/install-font.sh -n -P "$DEST" -d -F CormorantGaramond -f +R CormorantGaramond-Regular.ttf

where ``IFDIR`` is an environment variable indicating the directory
where :command:`install-font.sh` is located and ``DEST`` is an
environment variable indicating the directory that contains
:app:`groff`'s :file:`site-font` directory (not the actual
:file:`site-font` directory itself).  The ``-n`` option means don't
try to copy the TrueType file to where the system font files are
located.  The ``-P`` option takes as its argument the directory that
contains the :app:`groff`'s site-font directory.  Usually this is some
place like :file:`/usr/share/groff` or :file:`/usr/local/share/groff`,
but not all distributions create the :file:`site-font` directory.  If
you don't specify ``-P`` :command:`install-font.sh` will guess the
location.  (If the :file:`site-font` directory doesn't exist, or you
don't have write access to it I think you can use the environment
variable ``GROFF_FONT_PATH`` to tell :app:`groff` where to find it,
but I've never used that and don't know the specifics.  I often build
:app:`groff` from git and install it someplace my normal user has
write access to, so I haven't had to worry about it.)  The ``-d``
option says to make the font available to :command:`gropdf`.  The
``-F`` option takes an argument that specifies the font family name to
use.  This is the name that you would use with the ``.fam`` request or
the ``-f`` option to :command:`groff` to let it know you want to use
this font family.  The ``-f`` option takes an argument that specifies
the font style to use, ``+R``, ``+I``, ``+B``, or ``+BI``.  (The
``-f`` option can instead take a name, but I don't use that form and
can't explain the distinctions.)  The style (``R``, ``I``, ``B``, or
``BI``) is appended to the font family name specified with ``-F`` to
produce the name of the :app:`groff` font, and consequently the name
of the :app:`groff` font file that is written to the ``devps`` and
``devpdf`` directories under ``site-font``.  So, in this example, the
name of the :app:`groff` font and the :app:`groff` font file would be
:file:`CormorantGaramondR`.  The last argument to the script is the
name of the Truetype or OpenType file you are converting.

To complete the example, here are the commands to install the Italic,
Bold, and Bold Italic variants of Cormorant Garamond:

.. code:: bash

   $(IFDIR)/install-font.sh -n -P "$DEST" -d -F CormorantGaramond -f +I CormorantGaramond-Italic.ttf
   $(IFDIR)/install-font.sh -n -P "$DEST" -d -F CormorantGaramond -f +B CormorantGaramond-Bold.ttf
   $(IFDIR)/install-font.sh -n -P "$DEST" -d -F CormorantGaramond -f +BI CormorantGaramond-BoldItalic.

As I said in an earlier email to the list, I tend to put all four
commands into a script so I can run them again if something goes wrong
or when I need to install them on a new machine or in a new
installation of :app:`groff`.  In the case of Cormorant Garamond I named the
file :file:`install-cormorant-garamond.sh`.

**Later:** Peter Schaffter `pointed out`_ that the *simple* use of
:command:`install-font.sh` is:

.. code:: bash

   sudo install-font.sh fontfile

and then answer the questions the script asks.  He also pointed out
that it creates the :file:`site-font` directory and necessary
subdirectories if needed in, and here I quote: “the only two locations
it's ever likely to be”.  Looking at :command:`install-font.sh` reveal
those locations are :file:`/usr/local/share/groff` and
:file:`/usr/share/groff`, defaulting to
:file:`/usr/local/share/groff`; to get it to use
:file:`/usr/share/groff` you specify the ``-s`` option.

.. _pointed out: https://lists.gnu.org/archive/html/groff/2021-07/msg00090.html

For a walk-through of the simple use see the follow-up_.

.. _follow-up: link://slug/install-fontsh-the-simple-approach

*Last edited: 2021-07-15 17:46:40 EDT*

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
