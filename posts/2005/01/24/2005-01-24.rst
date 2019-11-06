.. title: Skeptical about Macro Hygiene?
.. slug: 2005-01-24
.. date: 2005-01-24 00:00:00 UTC-05:00
.. tags: old blog,scheme,lisp,macros,hygiene
.. category: oldblog
.. link: 
.. description: 
.. type: text


Eli Barzilay has a couple of interesting `USENET <http://groups-beta.g
oogle.com/group/comp.lang.scheme/msg/b9328703efaa8219>`__ `articles
<http://groups-
beta.google.com/group/comp.lang.scheme/msg/4301f80b6534a85>`__ on his
experience changing from ``defmacro`` to ``syntax-case``. Unfortunately, I
didn't understand Shriram Krishnamurthi's `comments on hygiene <http
://groups-
beta.google.com/group/comp.lang.scheme/msg/f7f4e2373846759c>`__ at
all.

Additions on Tuesday, 21 April 2009
-----------------------------------

I thought I'd better quote what he said:

    By the way, I've been skeptical about hygiene for the past six or
    seven years.  The hygiene algorithm struck me as such an obviously
    good idea that I simply couldn't understand what the MIT folks meant
    when they said (and I'm paraphrasing, loosely, from papers I haven't
    read in a decade) that the hygiene algorithm doesn't make sense.  Only
    a few years ago did I begin to unravel this, and now I almost entirely
    understand it.  In short, it has taken me nearly a decade to
    understand why someone did not understand something that I understood
    obviously, and it's only because what I understood obviously, I now
    barely understand at all. 

It's really simple to understand how to implement ``defmacro``.  It's
not simple to understand how to implement ``syntax-case``.  Throw in
modules, as in `PLT Scheme`_ (and R6RS_, apparently), and things are
even more difficult.  Throw in the oddity of writing ``syntax-case``/\
``syntax-rules`` macros with the pattern matching syntax, and you
really have to wonder.

I really wish somebody would sit down and write detailed survey
article comparing all the Lisp and Scheme macro systems and
considering all the interactions with modules and pattern matching.  I
think it's really needed.  [Do I say this somewhere else, too?]

.. _`PLT Scheme`: http://www.plt-scheme.org/

.. _R6RS: http://www.r6rs.org/
