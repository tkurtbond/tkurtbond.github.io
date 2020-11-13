.. title: SRFI-159 Supersedes Alix Shinn's fmt package
.. slug: srfi-159-supersedes-alix-shinns-fmt-package
.. date: 2020-11-13 14:21:48 UTC-05:00
.. tags: scheme,fmt,SRFI-159,Alex Shinn
.. category: computer
.. link: 
.. description: 
.. type: text

This is a note to help me remember to use `SRFI-159`_ instead of fmt_
when I can.

The scheme `SRFI-159`_ is similar to the `Chicken Scheme`_ fmt_ egg
and is written by Alex Shinn and references his original `fmt -
Combinator Formating`__ code on which the egg is based but it doesn’t
seem to be implemented for Chicken Scheme.  It does explain why there
isn’t a version of fmt for `Chibi Scheme`_, since Chibi Scheme
includes an implementation_ of SRFI-159 already.  There doesn't seem
to be a Snow_ version either.

.. _Chicken Scheme: http://call-cc.org/
.. _SRFI-159: https://srfi.schemers.org/srfi-159/srfi-159.html
.. _fmt:  - http://wiki.call-cc.org/eggref/5/fmt
__ http://synthcode.com/scheme/fmt/
.. _Chibi Scheme: https://github.com/ashinn/chibi-scheme
.. _implementation: https://github.com/ashinn/chibi-scheme/tree/master/lib/srfi/159
.. _Snow: http://snow-fort.org/
