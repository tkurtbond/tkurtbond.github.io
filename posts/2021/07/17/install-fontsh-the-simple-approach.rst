.. title: install-font.sh - The simple approach
.. slug: install-fontsh-the-simple-approach
.. date: 2021-07-17 15:36:43 UTC-04:00
.. tags: groff,install-font.sh,fonts,troff
.. category: computer/documents
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: command
.. role:: file

The simple approach to using `install-font.sh`_ to install
fonts for :app:`groff` probably works for almost everybody: call the
command with one argument, the font file, and answer the prompts.
This will install the fonts for :app:`groff`'s use under 
:file:`/usr/local/share/groff/site-font`, creating the directories if
necessary.  For instance:

.. _install-font.sh: https://www.schaffter.ca/mom/mom-05.html#install-font

.. code::

   $ install-font.sh Lora-Regular.ttf

will install the Regular variant of the font.

The only prompt where you need to do something other than accept the
default is the prompt for the style.  For :file:`Lora-Regular` you'd
specify ``+R``.  For italic, bold, and bold italic, the other
traditional :app:`troff` font styles, you'd specify ``+I``, ``+B``,
and ``+BI``.  One thing to notice is that in the walk-through below
the prompt for the style mentions ``+BD`` rather than ``+B`` for bold.
This means you have an older version of :command:`install-font.sh`,
but you should still specify ``+B`` for bold.  (This should be fixed
in a newer version of :command:`install-font.sh`.)

Here's a walk-through of installing the Lora_ font, assuming that
:command:`install-font.sh` is in your path.  (If your
:file:`/usr/local/share/groff` directory isn't writable for you, you
should prefix the command with ``sudo``.)


.. _Lora: https://fonts.google.com/specimen/Lora

.. code::

   $ install-font.sh Lora-Regular.ttf
   /usr/local/share/groff/site-font not found; creating.
   /usr/local/share/groff/site-font/devps not found; creating.
   /usr/local/share/groff/site-font/devpdf not found; creating.
   Processing Lora-Regular.ttf...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    with many parts BSD <http://fontforge.org/license.html>. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Done.
   Family name (default = Lora):
     =>Lora-Regular (Lora-Regular.ttf) assigned to family 'Lora'.
   Enter +STYLE (eg +R, +I, +BD, +BI), or a unique groff name for Lora-Regular.
   Leave blank to set name to 'Lora-Regular': +R
     =>Lora-Regular assigned groff fontname 'LoraR'.
   Creating LoraR...
   both uni03BC and uni00B5 map to mc at /usr/local/bin/afmtodit line 6411.
   Done.
   Installing LoraR in /usr/local/share/groff/site-font/devps/... Done.
   Make LoraR available to gropdf? (y/n; default = y)
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing LoraR in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy Lora-Regular.ttf to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n)
   Install Lora-Regular.ttf manually to make it available system-wide.

   $ install-font.sh Lora-Italic.ttf
   Processing Lora-Italic.ttf...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    with many parts BSD <http://fontforge.org/license.html>. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Done.
   Family name (default = Lora):
     =>Lora-Italic (Lora-Italic.ttf) assigned to family 'Lora'.
   Enter +STYLE (eg +R, +I, +BD, +BI), or a unique groff name for Lora-Italic.
   Leave blank to set name to 'Lora-Italic': +I
     =>Lora-Italic assigned groff fontname 'LoraI'.
   Creating LoraI...
   both uni03BC and uni00B5 map to mc at /usr/local/bin/afmtodit line 6411.
   Done.
   Installing LoraI in /usr/local/share/groff/site-font/devps/... Done.
   Make LoraI available to gropdf? (y/n; default = y)
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing LoraI in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy Lora-Italic.ttf to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n)
   Install Lora-Italic.ttf manually to make it available system-wide.

   $ install-font.sh Lora-Bold.ttf
   Processing Lora-Bold.ttf...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    with many parts BSD <http://fontforge.org/license.html>. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Glyph bounding box data exceeds font bounding box data for GID 4
     Subsequent errors will not be reported.
   In GID 769 the advance width (1316) is greater than the stated maximum (1291)
     Subsequent errors will not be reported.
   Done.
   Family name (default = Lora):
     =>Lora-Bold (Lora-Bold.ttf) assigned to family 'Lora'.
   Enter +STYLE (eg +R, +I, +BD, +BI), or a unique groff name for Lora-Bold.
   Leave blank to set name to 'Lora-Bold': +B
     =>Lora-Bold assigned groff fontname 'LoraB'.
   Creating LoraB...
   both uni00B5 and uni03BC map to mc at /usr/local/bin/afmtodit line 6411.
   Done.
   Installing LoraB in /usr/local/share/groff/site-font/devps/... Done.
   Make LoraB available to gropdf? (y/n; default = y)
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing LoraB in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy Lora-Bold.ttf to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n)
   Install Lora-Bold.ttf manually to make it available system-wide.

   $ install-font.sh Lora-BoldItalic.ttf
   Processing Lora-BoldItalic.ttf...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    with many parts BSD <http://fontforge.org/license.html>. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Glyph bounding box data exceeds font bounding box data for GID 4
     Subsequent errors will not be reported.
   In GID 776 the advance width (1297) is greater than the stated maximum (1273)
     Subsequent errors will not be reported.
   Done.
   Family name (default = Lora):
     =>Lora-BoldItalic (Lora-BoldItalic.ttf) assigned to family 'Lora'.
   Enter +STYLE (eg +R, +I, +BD, +BI), or a unique groff name for Lora-BoldItalic.
   Leave blank to set name to 'Lora-BoldItalic': +BI
     =>Lora-BoldItalic assigned groff fontname 'LoraBI'.
   Creating LoraBI...
   both uni03BC and uni00B5 map to mc at /usr/local/bin/afmtodit line 6411.
   Done.
   Installing LoraBI in /usr/local/share/groff/site-font/devps/... Done.
   Make LoraBI available to gropdf? (y/n; default = y)
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing LoraBI in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy Lora-BoldItalic.ttf to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n)
   Install Lora-BoldItalic.ttf manually to make it available system-wide.

