.. title: Building my website with cook
.. slug: 2008-02-03
.. date: 2008-02-03 00:00:00 UTC-05:00
.. tags: old blog,software,cook
.. category: oldblog
.. link: 
.. description: 
.. type: text



I'm trying to switch to `cook
<http://miller.emu.id.au/pmiller/software/cook/>`__ to build this
website. I have been using GNU make, but unfortunately there are some
files that need rebuilt (normally) only when new source files are
added, not when they're modified, and I haven't been able to figure
out how to do that in GNU make, and this unfortunately causes
*everything* to be rebuilt. Cook, on the other hand, can use file
fingerprints to check if the contents of the file have actually
changed, so I ought to be able to do what I want in cook. I not quite
sure I've completely succeeded yet, however.

:Tuesday, 21 April 2009: Eventually I abandoned Docbook for building
    my site enirely, switching over to `Sphinx <http://sphinx-doc.org/>`__
    It builds faster, doesn't need arcane make/cook hackery, and has a
    modern but still simpler appearance.
