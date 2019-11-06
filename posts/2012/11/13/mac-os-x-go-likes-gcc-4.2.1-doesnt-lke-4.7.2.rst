.. title: Mac OS X go likes gcc 4.2.1 doesn't lke 4.7.2
.. slug: mac-os-x-go-likes-gcc-4.2.1-doesnt-lke-4.7.2
.. date: 2012-11-13 13:58:24 UTC-05:00
.. tags: mac os x,go language,gcc
.. category: computer/MacOSX
.. link: 
.. description: 
.. type: text


I have gcc from MacPorts (“gcc version 4.7.2 (MacPorts gcc47
4.7.2_2)”) installed on my laptop running Mac OS X 10.6.8, and when
updated and recompiled go the tests failed in the race detector with a
message about a MachO segment being missing.  I put /usr/bin/gcc at
the front of the path, and everything compiled tested fine.
