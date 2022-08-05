.. title: Splitting Strings on a Delimiter in the Ada Programming Language
.. slug: splitting-strings-on-a-delimiter-in-the-ada-programming-language
.. date: 2022-08-05 11:10:39 UTC-04:00
.. tags: ada,programming,splitting strings
.. category: computer/ada
.. link: 
.. description: 
.. type: text

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
declared, ``String`` variable always has the same length.

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

.. include:: files/ada/split/split_bounded.adb
   :code: ada

Here's the output:

.. include:: files/ada/split/split_bounded.txt
   :literal:

The ``Unbounded_String`` type in Ada grows dynamically as needed,
but is not as time efficient as fixed strings or bounded strings. 

.. include:: files/ada/split/split_unbounded.adb
   :code: ada

Here's the output:

.. include:: files/ada/split/split_bounded.txt
   :literal:

      




