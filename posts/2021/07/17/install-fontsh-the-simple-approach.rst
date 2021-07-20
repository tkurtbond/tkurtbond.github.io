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

The simple approach to using `install-font.sh`_ to install fonts for
:app:`groff` probably works for almost everybody.  

First, make sure that `FontForge`_ is installed; it is free and open
source and available for installation in most distributions.  Second,
call the :command:`install-font.sh` command with one argument, the
font file, and answer the prompts.

This will install the fonts for :app:`groff`'s use in the appropriate
directories under :file:`/usr/local/share/groff`, creating the
directories if necessary.  If you need to install into
:file:`/usr/share/groff` you should specify the ``-s`` option to the
script.  For instance:

.. _install-font.sh: https://www.schaffter.ca/mom/mom-05.html#install-font
.. _FontForge: https://fontforge.org/

.. code::

   $ install-font.sh Lora-Regular.ttf

will install the Regular variant of the font, leading you through four
prompts, for three of which you just need to take the default.

The only prompt where you need to do something other than accept the
default is the prompt for the style.  For :file:`Lora-Regular` you'd
specify ``+R``.  For italic, bold, and bold italic, the other
traditional :app:`troff` font styles, you'd specify ``+I``, ``+B``,
and ``+BI``.  The prompt lists them all for you to choose from.

Here's a walk-through of installing the Lora_ font, assuming that
:command:`install-font.sh` is in your path.  (If your
:file:`/usr/local/share/groff` directory isn't writable for your
normal user, you should prefix the command with ``sudo``.)

:command:`install-font.sh` does produce a lot of output, but the
colorizing helps pick out the important things.  I've put the
responses the user types in bold and red, and added “<RETURN>”
where the user presses the RETURN key to accept defaults.


.. _Lora: https://fonts.google.com/specimen/Lora

.. raw:: html

   <pre>
   $ <span style="color:red;"><b>install-font.sh Lora-Regular.ttf</b></span>
   /usr/local/share/groff/site-font not found; creating.
   /usr/local/share/groff/site-font/devps not found; creating.
   /usr/local/share/groff/site-font/devpdf not found; creating.
   Processing <span style="color:teal;">Lora-Regular.ttf</span>...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later &lt;http://gnu.org/licenses/gpl.html&gt;
    with many parts BSD &lt;http://fontforge.org/license.html&gt;. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Done.
   Family name (default = Lora): <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
     =&gt;<span style="color:teal;">Lora-Regular</span> (Lora-Regular.ttf) assigned to family '<span style="color:olive;">Lora</span>'.
   Enter +STYLE (eg +R, +I, +B, +BI), or a unique groff name for <span style="color:teal;">Lora-Regular</span>.
   Leave blank to set name to '<span
   style="color:teal;">Lora-Regular</span>': <span style="color:red;"><b>+R</b></span>
     =&gt;<span style="color:teal;">Lora-Regular</span> assigned groff fontname '<span style="color:olive;">LoraR</span>'.
   Creating <span style="color:olive;">LoraR</span>...
   afmtodit: both uni00B5 and uni03BC map to mc at /Users/tkb/sw/versions/groff/git/bin/afmtodit line 6441.
   Done.
   Installing <span style="color:olive;">LoraR</span> in /usr/local/share/groff/site-font/devps/... Done.
   Make <span style="color:olive;">LoraR</span> available to gropdf? (y/n; default = y) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing <span style="color:olive;">LoraR</span> in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy <span style="color:teal;">Lora-Regular.ttf</span> to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Install <span style="color:teal;">Lora-Regular.ttf</span> manually to make it available system-wide.
   $ <span style="color:red;"><b>install-font.sh Lora-Italic.ttf</b></span>
   Processing <span style="color:teal;">Lora-Italic.ttf</span>...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later &lt;http://gnu.org/licenses/gpl.html&gt;
    with many parts BSD &lt;http://fontforge.org/license.html&gt;. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Done.
   Family name (default = Lora): <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
     =&gt;<span style="color:teal;">Lora-Italic</span> (Lora-Italic.ttf) assigned to family '<span style="color:olive;">Lora</span>'.
   Enter +STYLE (eg +R, +I, +B, +BI), or a unique groff name for <span style="color:teal;">Lora-Italic</span>.
   Leave blank to set name to '<span
   style="color:teal;">Lora-Italic</span>': <span style="color:red;"><b>+I</b></span>
     =&gt;<span style="color:teal;">Lora-Italic</span> assigned groff fontname '<span style="color:olive;">LoraI</span>'.
   Creating <span style="color:olive;">LoraI</span>...
   afmtodit: both uni00B5 and uni03BC map to mc at /Users/tkb/sw/versions/groff/git/bin/afmtodit line 6441.
   Done.
   Installing <span style="color:olive;">LoraI</span> in /usr/local/share/groff/site-font/devps/... Done.
   Make <span style="color:olive;">LoraI</span> available to gropdf? (y/n; default = y) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing <span style="color:olive;">LoraI</span> in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy <span style="color:teal;">Lora-Italic.ttf</span> to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Install <span style="color:teal;">Lora-Italic.ttf</span> manually to make it available system-wide.
   $ <span style="color:red;"><b>install-font.sh Lora-Bold.ttf</b></span>
   Processing <span style="color:teal;">Lora-Bold.ttf</span>...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later &lt;http://gnu.org/licenses/gpl.html&gt;
    with many parts BSD &lt;http://fontforge.org/license.html&gt;. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Glyph bounding box data exceeds font bounding box data for GID 4
     Subsequent errors will not be reported.
   In GID 769 the advance width (1316) is greater than the stated maximum (1291)
     Subsequent errors will not be reported.
   Done.
   Family name (default = Lora): <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
     =&gt;<span style="color:teal;">Lora-Bold</span> (Lora-Bold.ttf) assigned to family '<span style="color:olive;">Lora</span>'.
   Enter +STYLE (eg +R, +I, +B, +BI), or a unique groff name for <span style="color:teal;">Lora-Bold</span>.
   Leave blank to set name to '<span
   style="color:teal;">Lora-Bold</span>': <span style="color:red;"><b>+B</b></span>
     =&gt;<span style="color:teal;">Lora-Bold</span> assigned groff fontname '<span style="color:olive;">LoraB</span>'.
   Creating <span style="color:olive;">LoraB</span>...
   afmtodit: both uni00B5 and uni03BC map to mc at /Users/tkb/sw/versions/groff/git/bin/afmtodit line 6441.
   Done.
   Installing <span style="color:olive;">LoraB</span> in /usr/local/share/groff/site-font/devps/... Done.
   Make <span style="color:olive;">LoraB</span> available to gropdf? (y/n; default = y) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing <span style="color:olive;">LoraB</span> in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy <span style="color:teal;">Lora-Bold.ttf</span> to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Install <span style="color:teal;">Lora-Bold.ttf</span> manually to make it available system-wide.
   $ install-font.sh Lora-BoldItalic.ttf
   Processing <span style="color:teal;">Lora-BoldItalic.ttf</span>...
   Running fontforge...
   Copyright (c) 2000-2020. See AUTHORS for Contributors.
    License GPLv3+: GNU GPL version 3 or later &lt;http://gnu.org/licenses/gpl.html&gt;
    with many parts BSD &lt;http://fontforge.org/license.html&gt;. Please read LICENSE.
    Version: 20201107
    Based on sources from 2020-11-16 19:11 UTC-D.
   The following table(s) in the font have been ignored by FontForge
     Ignoring 'STAT' style attributes table
   Glyph bounding box data exceeds font bounding box data for GID 4
     Subsequent errors will not be reported.
   In GID 776 the advance width (1297) is greater than the stated maximum (1273)
     Subsequent errors will not be reported.
   Done.
   Family name (default = Lora): <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
     =&gt;<span style="color:teal;">Lora-BoldItalic</span> (Lora-BoldItalic.ttf) assigned to family '<span style="color:olive;">Lora</span>'.
   Enter +STYLE (eg +R, +I, +B, +BI), or a unique groff name for <span style="color:teal;">Lora-BoldItalic</span>.
   Leave blank to set name to '<span
   style="color:teal;">Lora-BoldItalic</span>': <span style="color:red;"><b>+BI</b></span>
     =&gt;<span style="color:teal;">Lora-BoldItalic</span> assigned groff fontname '<span style="color:olive;">LoraBI</span>'.
   Creating <span style="color:olive;">LoraBI</span>...
   afmtodit: both uni00B5 and uni03BC map to mc at /Users/tkb/sw/versions/groff/git/bin/afmtodit line 6441.
   Done.
   Installing <span style="color:olive;">LoraBI</span> in /usr/local/share/groff/site-font/devps/... Done.
   Make <span style="color:olive;">LoraBI</span> available to gropdf? (y/n; default = y) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Checking for gropdf executable and devpdf directory... gropdf found.
   Installing <span style="color:olive;">LoraBI</span> in /usr/local/share/groff/site-font/devpdf/... Done.
   Copy <span style="color:teal;">Lora-BoldItalic.ttf</span> to /usr/local/share/fonts/truetype/Lora/
     (y/n; default = n) <span style="color:red;"><b>&lt;RETURN&gt;</b></span>
   Install <span style="color:teal;">Lora-BoldItalic.ttf</span> manually to make it available system-wide.
   </pre>

         
*Last edited: 2021-07-20 12:40:30 EDT*

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   time-stamp-line-limit: -20
   End:
