.. title: Splitting Strings on a Delimiter in the Ada Programming Language
.. slug: splitting-strings-on-a-delimiter-in-the-ada-programming-language
.. date: 2022-08-05 11:10:39 UTC-04:00
.. tags: ada,programming,splitting strings,splitting strings in ada
.. category: computer/ada
.. link: 
.. description: 
.. type: text

*Last edited: 2022-12-06 13:30:34 EST*

When I did a search for “splitting strings on a delimiter in the Ada
programming language” recently I did not get many useful results.
Eventually I stumbled over `GNAT.String_Split`_ which is an
instantiation of the generic package `GNAT.Array_Split`_.  I also
finally found_ `GNATCOLL.Strings_Impl`_ and `GNATCOLL.Strings`_, its
default instantiation, which looks especially interesting, contains
a split implementation, and which seems to be designed to be a more
efficient string implementation than  than ``Ada.Strings.Unbounded``.

.. _GNAT.String_Split: https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gnat_rm/GNAT-String_005fSplit-g-strspl-ads.html#GNAT-String_005fSplit-g-strspl-ads
.. _GNAT.Array_Split: https://gcc.gnu.org/onlinedocs/gcc-12.1.0/gnat_rm/GNAT-Array_005fSplit-g-arrspl-ads.html#GNAT-Array_005fSplit-g-arrspl-ads
.. _found: https://blog.adacore.com/new-strings-package-in-gnatcoll
.. _GNATCOLL.Strings_Impl: https://github.com/AdaCore/gnatcoll-core/blob/master/src/gnatcoll-strings_impl.ads
.. _GNATCOLL.Strings: https://github.com/AdaCore/gnatcoll-core/blob/master/src/gnatcoll-strings.ads

However, those are all a little complicated, so it might be
appropriate to show a simpler implementation.

The ``String`` type in Ada is a array of characters.  Once
declared, a ``String`` variable always has the same length.  That
means that all the strings in an array of strings have to be the same
length.  However, an ``access`` (Ada's version of a 
pointer) to a ``String`` can point to a string of any length, so for
this version we'll return an array of pointers to ``String``.

Operations on ``String`` are defined in `Ada.Strings.Fixed`_.

.. _Ada.Strings.Fixed: http://www.ada-auth.org/standards/rm12_w_tc1/html/RM-A-4-3.html

.. include:: files/ada/split/split_fixed.adb
   :code: ada

Here's the output:

.. include:: files/ada/split/split_fixed.txt
   :literal:

The ``Bounded_String`` type in Ada has a maximum capacity and a
current length.  You instantiate a new package for each different
maximum capacity that you want, producing a different type for each.
You can assign any string smaller than or equal to the maximum length,
and the current length is recorded.

Operations on ``Bounded_String`` are defined in
`Ada.Strings.Bounded`_.

.. _Ada.Strings.Bounded: http://www.ada-auth.org/standards/rm12_w_tc1/html/RM-A-4-4.html

.. include:: files/ada/split/split_bounded.adb
   :code: ada

Here's the output:

.. include:: files/ada/split/split_bounded.txt
   :literal:

The ``Unbounded_String`` type in Ada grows dynamically as needed,
but is not as time efficient as fixed strings or bounded strings.
For this version, we'll use `Ada.Containers.Vectors`_ for a
dynamically expending vector, rather than a fixed size vector.

Operations on ``Unbounded_String`` are defined in
`Ada.Strings.Unbounded`_.

.. _Ada.Strings.Unbounded: http://www.ada-auth.org/standards/rm12_w_tc1/html/RM-A-4-5.html

.. _Ada.Containers.Vectors: http://www.ada-auth.org/standards/rm12_w_tc1/html/RM-A-18-2.html

.. include:: files/ada/split/split_unbounded.adb
   :code: ada

Here's the output:

.. include:: files/ada/split/split_bounded.txt
   :literal:

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   End:

