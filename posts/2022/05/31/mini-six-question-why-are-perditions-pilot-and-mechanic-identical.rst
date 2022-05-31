.. title: Mini Six Question: Why are Perdition’s Pilot and Mechanic Identical?
.. slug: mini-six-question-why-are-perditions-pilot-and-mechanic-identical
.. date: 2022-05-31 14:41:21 UTC-04:00
.. tags: rpg,mini six,perdition,opend6,d6,rpg utilities
.. category: gaming/rpg
.. link: 
.. description: 
.. type: text

As part of my work making an `SRD for Mini
Six <'https://github.com/tkurtbond/Minimal-OpenD6'>`__ I was reminded
that in the Perdition sample setting the character templates for the
Pilot and the Mechanic are identical, which seems odd. Here, take a
look:

.. figure:: /mini-six-perdition-pilot-and-mechanic.png
   :alt: Mini Six’s Pilot and Mechanic, from the Perdition sample setting

   Mini Six’s Pilot and Mechanic, from the Perdition sample setting

Here’s a version of the original Mechanic in text format:

| **Mechanic**
| **Might 2D+1**
| **Agility 3D+2** — Dodge 5D+1, Pilot 5D+2
| **Wit 3D+1** — Computer 4D, Navigation 5D+1, Repair 4D+1
| **Charm 2D+2** — Diplomacy 4D
| **Static:** Dodge 16, Block 7, Parry 7, Soak 7
| **Perks & Comps:** None
| **Gear:** Light Pistol

Anyway, I thought something like this might be better for the Mechanic:

| **Alternate Mechanic**
| **Might 2D+1**
| **Agility 3D+1** — Dodge 5D, Pilot 4D
| **Wit 3D+2** — Computer 6D, Navigation 4D+1, Repair 6D+1
| **Charm 2D+2** — Diplomacy 3D
| **Perks & Comps:** None
| **Gear:** Light Pistol
| **Static:** Dodge 15; Block 7; Parry 7; Soak 7

Still has some skill at Pilot and Navigation, but not as good at those
as the Pilot. Better Computer and Repair skills. Probably willing to
pick up a pistol and shoot it if really necessary, but also probably no
better at it that default, so Pistol isn’t listed.

What do you think?

Interestingly, the Pilot and the Mechanic templates are built on 12D
in attributes and 8D+2 in skills, instead of the standard 7D in
skills, so I made this alternate version with the same amount. I
haven’t checked the other templates. (I’ll probably do that at some
point. Rather than do the counting manually, I’ll probably type them
up as YAML and feed them through sm6_, a program I wrote that counts
the costs of all the dice and prints out a summary. I’ve got a couple
other programs, sm6rst_ and `sm6troff-ms`_ that can read that same
YAML and produce output in `reStructuredText
<https://docutils.sourceforge.io/rst.html>`__ or troff (T1_, G1_)
formats, for including in my documents.)

.. _sm6: https://github.com/tkurtbond/m6charcost/blob/main/sm6.scm
.. _sm6rst: https://github.com/tkurtbond/m6charcost/blob/main/sm6rst.scm
.. _sm6troff-ms: https://github.com/tkurtbond/m6charcost/blob/main/sm6troff-ms.scm
.. _T1: https://troff.org/
.. _G1: https://www.gnu.org/software/groff/
