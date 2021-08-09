.. title: Savage Worlds Wild Die Rolls at Anydice.com
.. slug: savage-worlds-wild-die-rolls-at-anydicecom
.. date: 2021-07-04 15:51:54 UTC-04:00
.. tags: rpg,savage worlds,anydice.com
.. category: gaming/rpg
.. link: 
.. description: 
.. type: text

Just for reference, here is the `Anydice.com`_ code for Savage Worlds
Wild Die rolls:

.. code::

   output [highest of [explode d4] and [explode d6]] named "d4 or wild die"
   output [highest of [explode d6] and [explode d6]] named "d6 or wild die"
   output [highest of [explode d8] and [explode d6]] named "d8 or wild die"
   output [highest of [explode d10] and [explode d6]] named "d10 or wild die"
   output [highest of [explode d12] and [explode d6]] named "d12 or wild die"   

Here's a link to the results_.

.. _results: https://anydice.com/program/23126/at_least
.. _Anydice.com: https://anydice.com/
