.. title: Customizing pandoc ms output with a Lua filter
.. slug: customizing-pandoc-ms-output-with-a-lua-filter
.. date: 2020-05-03 01:01:53 UTC-04:00
.. tags: pandoc,lua filters,groff ms macros,restructuredtext,pandoc-discuss,pdf
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app

This article started as a message_ I sent to the the pandoc-discuss_
Google Group.  This version has more links and has been slightly
reworded.

.. _message: https://groups.google.com/d/msg/pandoc-discuss/UJgyLbxTNxo/MZDVFts-BAAJ
.. _pandoc-discuss: https://groups.google.com/forum/#!forum/pandoc-discuss

I work with ReStructuredText_ documents a lot and often use pandoc_ to
format them, especially to PDF by way of :app:`pandoc`\ 's ``ms``
output format, which uses :app:`groff` with the ``-ms`` macros to produce the
PDF output.  Using ``ms`` output is fast, :app:`groff` is usually available
on the operating systems I use, and if you *do* have to install :app:`groff`
it is easy to do and much, much smaller than any :app:`TeX` distributions.

.. _ReStructuredText: https://docutils.sourceforge.io/rst.html
.. _pandoc: https://pandoc.org/

However, it would be a nice to be able to customize the ``ms`` output
more for specific input, like if you are using technical writing and
are pining for something like the various inline roles of DocBook_, or
wanted poems to be typeset more stylishly that the ``ms`` output does.

.. _DocBook: https://tdg.docbook.org/tdg/5.1/ch02.html#s.inline

You should probably be a little familiar with the `Pandoc User
Manual`_ and have the documentation for `Lua Filter`_\'s available for
reference while reading this article.  And having a reading
familiarity with groff_ and its manual_ and specifically the `-ms
macros`_ will be useful too.  And maybe Lua_ as well.

.. _`Pandoc User Manual`: https://pandoc.org/MANUAL.html
.. _groff: https://www.gnu.org/software/groff/
.. _manual: https://www.gnu.org/software/groff/manual/
.. _`-ms macros`: https://www.gnu.org/software/groff/manual/html_node/ms.html#ms
.. _Lua: https://www.lua.org/

Starting with an article_ from Dave Jarvis that had an example `Lua
filter`_ for customizing the :app:`ConTeXt` output and a little help
from the pandoc-discuss mailing list I came up with this example `Lua
Filter`_ that formats program names and poems specially.

.. _article: https://dave.autonoma.ca/blog/2020/04/28/typesetting-markdown-part-8/
.. _`Lua Filter`: https://pandoc.org/lua-filters.html

This filter wraps spans with a class, such as from interpreted text
roles defined in the source ReST (like ``:program:`pandoc```) in calls
to user defined :app:`groff` strings ``\*[start<class>]`` and
``\*[stop<class>]``.  (I've specified the string definitions for
``\*[startprogram]`` and ``\*[stopprogram]`` in the source ReST as a
raw block for ``ms`` output but they could be in a customized ``ms``
pandoc template, too.)  These strings can include :app:`groff` escapes to
change the font and the glyph color and then change back to the
previous font and glyph color.  In this example I made PDF output for
the interpreted text role ``program`` come out in a constant width
font and in red.

It also wraps divs with classes with calls to user defined :app:`groff`
macros ``.start<class>`` and ``.stop<class>`` (also included in the
source ReST in the raw block for ms output).

For divs with the poem class, it converts any contained LineBlock
elements into a list of Plain elements containing its contents,
avoiding the ms output for the LineBlock starting with ``.LP``, which
would cancel the ``.DS`` (display start) macro I want to use in the
.startpoem macro definition.  The ``.LP`` would also reset the font family
in use to the default, another reason to avoid it. [#LP]_

The filter also converts the empty element that occurs in the line block
as a result of a blank line in the line block input into a RawBlock
that creates a blank line in the ms output, to show the division into
stanzas of the poem.

Interestingly, the first Str elements in the each line in the content
of the line block preserved the leading spaces from the input as
Unicode NO-BREAK SPACE characters, preserving indentation of lines in
the line block.  Unfortunately, the width of those spaces alone is not
enough create a visually distinct indentation, so this filter changes
those Str elements into a RawInline that outputs a :app:`groff` horizfontal
movement whose width is based on the number of leading NO-BREAK SPACE
characters, and follow this with a new Str element that has the
leading NO-BREAK SPACE characters removed.

Here is the Lua filter:

.. code:: lua

   onig = require ("rex_onig") -- Need a regex package that understands UTF8.
   -- text in LineBreak preserves leading spaces as Unicode NO-BREAK SPACE
   leading_nobreakspace_rx = onig.new ("^(\u{a0}+)(.*)$", nil, "UTF8")

   function Div( element )
     local annotation = element.classes:find_if( matches )
     local numPara = 0
      if annotation then
        annotation = annotation:gsub( "[^%w]*", "" )
        if annotation == "poem" then
           element = pandoc.walk_block (
              element, {
                 -- Replace LineBlock element with a list of Plain elements
                 -- containing the LineBlock's subelements.
                 LineBlock = function (el)
                    local l = {}
                    for _, subel in ipairs (el.content) do
                       if #subel == 0 then
                          -- If subel is an empty table, output a raw empty line
                          table.insert (l, pandoc.RawBlock ("ms", "\n\n"))
                       else
                          -- Check for leading NO-BREAK SPACE charaters
                          local m1, m2 = onig.match (subel[1].text,
                                                     leading_nobreakspace_rx)
                          if m1 then
                             -- Replace the NO-BREAK SPACE characters with a raw
                             -- groff horizontal movement, because the
                             -- NO-BREAK SPACE characters are too narrow.
                             table.insert (subel, 1, pandoc.RawInline ("ms", string.format ("\\h'%dn'", utf8.len (m1))))
                             -- Modify what was used to be the first item to just
                             -- include the trailing characters of the match.
                             subel[2] = pandoc.Str (m2)
                             table.insert (l, pandoc.Plain (subel))
                          else
                             -- Just put the subel in Plain element.
                             table.insert (l, (pandoc.Plain (subel)))
                          end
                       end
                    end
                    return l
           end })
        end
        return {
           ms( ".start", annotation ),
           element,
           ms( ".stop", annotation )
        }
     end
   end

   function Span(element)
     local annotation = element.classes:find_if(matches)

     if annotation then
        annotation = annotation:gsub("[^%w]*", "")

        return {
           ms_inline("\\*[start", annotation, "]"),
           element,
           ms_inline("\\*[stop", annotation, "]")
        }
     end
   end

   function matches( s )
    return s:match( "^%a+" )
   end

   function ms( macro, annotation )
    return pandoc.RawBlock( "ms", macro .. annotation )
   end

   function ms_inline (macro, annotation, stop)
     return pandoc.RawInline ("ms", macro .. annotation .. stop)
   end

Here is the ReST source of the document:

.. code:: ReST

   Lua Filters For Massaging ``ms`` Output
   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   .. raw:: ms

      .ds startprogram \\f[CW]\\m[red]
      .ds stopprogram \\m[]\\fP
      .de startpoem
      .ds OLDFAM \\*[FAM]
      .ds FAM BM
      .DS I 3
      ..
      .de stoppoem
      .DE
      .ds FAM \\*[OLDFAM]
      ..

   .. role:: program

   This is a sentence.  This sentence talks about :program:`pandoc`.
   This is
   another sentence.

   .. class:: poem

      | Some say the world will end in fire,
      |    Some say in ice.
      | From what I've tasted of desire
      |    I hold with those who favor fire.
      | But if it had to perish twice,
      |    I think I know enough of hate
      |    To say that for destruction ice
      |    Is also great,
      | And would suffice.
      |
      | And another line,
      |    And an indented line.

   This is a final sentence.

And here is the ms output:

.. code:: groff

   .SH 1
   Lua Filters For Massaging \f[CB]ms\f[B] Output
   .pdfhref O 1 "Lua Filters For Massaging ms Output"
   .pdfhref M "lua-filters-for-massaging-ms-output"
   .ds startprogram \\f[CW]\\m[red]
   .ds stopprogram \\m[]\\fP
   .de startpoem
   .ds OLDFAM \\*[FAM]
   .ds FAM BM
   .DS I 3
   ..
   .de stoppoem
   .DE
   .ds FAM \\*[OLDFAM]
   ..
   .LP
   This is a sentence.
   This sentence talks about \*[startprogram]pandoc\*[stopprogram].
   This is
   another sentence.
   .startpoem
   Some say the world will end in fire,
   \h'3n'Some say in ice.
   From what I\[aq]ve tasted of desire
   \h'3n'I hold with those who favor fire.
   But if it had to perish twice,
   \h'3n'I think I know enough of hate
   \h'3n'To say that for destruction ice
   \h'3n'Is also great,
   And would suffice.

   And another line,
   \h'3n'And an indented line.
   .stoppoem
   .LP
   This is a final sentence.

The command to produce the ms output is:

.. code::

   pandoc -f rst -t ms --lua-filter classify-rst-ms.lua --wrap=preserve poem-plus.rst

and the command to produce a PDF is:

.. code:: bash

   pandoc -f rst -t ms --lua-filter classify-rst-ms.lua --wrap=preserve poem-plus.rst --output=poem-plus-rst-ms.pdf

Here_ is the output PDF.

.. _Here: /poem-plus-rst-ms.pdf

Being able to rewrite the tree and insert RawBlocks and RawInlines is
really powerful when it comes to customizing output for particular
output formats.

I hope this example is useful for others like me just learning to use
Lua filters.

.. [#LP] The ``.LP`` macro in the ``-ms`` macros resets a lot of
   things back to the default when it is used, so if you want the custom
   :app:`groff` setting from your user defined macros to continue from the
   start to the end you can't allow the use of ``.LP`` between the
   ``.start<class>`` and ``.stop<class>`` macros.
