.. title: The School of Niklaus Wirth: The Art of Simplicity
.. slug: the-school-of-niklaus-wirth-the-art-of-simplicity
.. date: 2022-07-04 11:33:38 UTC-04:00
.. tags: niklaus wirth,oberon,ceres,modula-2,lilith,pascal,unix,c,recent reading
.. category: books/read/2022
.. link: 
.. description: 
.. type: text

I've just finished `The School of Niklaus Wirth: The Art of
Simplicity`__, by Laszlo Boszormenyi (Editor), Jurg Gutknecht
(Editor), and Gustav Pomberger (Editor).  

__ https://www.amazon.com/School-Niklaus-Wirth-Art-Simplicity/dp/1558607234

This was an excellent retrospective of Niklaus Wirth's work, covering
the many important (and sometimes neglected) innovations he and his
coworkers created.  Although it was published in 2000 it is still a
very interesting and inspiring read.

Niklaus Wirth is perhaps best known for Pascal_.  I learned Pascal
early on in my computing career, and found it much more to my taste
than BASIC, the language I had the most experience with previously.  I
programmed in `Apple Pascal`_ (based on `UCSD Pascal`_) on the Apple
II+, and used Pascal on the original Macintosh.  Much of my
instruction at college used Oregon Software's Pascal 2 system for
VAX/VMS.  I also had an opportunity to use Pascal at work, using
`Turbo Pascal`_ on MS-DOS.  While I found the expressiveness and power
of C very attractive, I still found the simpler syntax and safer type
system of Pascal very worthwhile, and missed it when writing C.

.. _Pascal: https://en.wikipedia.org/wiki/Pascal_(programming_language)
.. _Apple Pascal: https://en.wikipedia.org/wiki/Apple_Pascal
.. _UCSD Pascal: https://en.wikipedia.org/wiki/UCSD_Pascal
.. _Turbo Pascal: https://en.wikipedia.org/wiki/Turbo_Pascal

However, I found Wirth's later programming language, Oberon_ (see the
original_ and revised_ language reports, and at archive.org: OO_,
OR_), and the `operating system`_ it was developed for, also called
Oberon, to be even more interesting.  While I never used the Ceres
computer on which Oberon originally ran, I **did** used the later
versions of the Oberon system that ran hosted on Linux.  I was
particularly inspired by the further development of `Oberon-2`_,
designed by Wirth and Hanspeter Mössenböck (see the language report,
O2A_, O2B_), and used in a wonderful book, `Object-Oriented
Programming in Oberon-2`, also by Mössenböck (OOP1_, OOP2_, and at
archive.org: OOP1A_, OOP2A_).

.. _Oberon: https://en.wikipedia.org/wiki/Oberon_(programming_language)
.. _original: https://people.inf.ethz.ch/wirth/Oberon/Oberon.Report.pdf
.. _revised: https://people.inf.ethz.ch/wirth/Oberon/Oberon07.Report.pdf
.. _OO: https://web.archive.org/web/20220511145109/https://people.inf.ethz.ch/wirth/Oberon/Oberon.Report.pdf
.. _OR: https://web.archive.org/web/20220601054803/https://people.inf.ethz.ch/wirth/Oberon/Oberon07.Report.pdf
.. _operating system: https://en.wikipedia.org/wiki/Oberon_(operating_system)
.. _Oberon-2: https://en.wikipedia.org/wiki/Oberon-2
.. _O2A: https://link.springer.com/content/pdf/bbm%3A978-3-642-97479-3%2F1.pdf
.. _O2B: http://www.math.bas.bg/bantchev/place/oberon/Oberon2-Report.pdf
.. _OOP1: http://norayr.am/papers/oop_in_oberon-2_book.pdf
.. _OOP1A: https://web.archive.org/web/20220704171021/http://norayr.am/papers/oop_in_oberon-2_book.pdf
.. _OOP2: https://ssw.jku.at/Research/Books/Oberon2.pdf
.. _OOP2A: https://web.archive.org/web/20220704033614/https://ssw.jku.at/Research/Books/Oberon2.pdf

Unfortunately most of my work at that time involved Unix heavily, and
it was difficult to write Oberon programs that interacted directly
with Unix, because Oberon's API_\s were quite different than those of
Unix and C.  (I've since found some Oberon compilers that work a
little better on Unix machines, but most Oberon software continues to
be specific to the Oberon system.

.. _API: https://en.wikipedia.org/wiki/API

Alas, Oberon was indeed `the overlooked jewel`_.

.. _the overlooked jewel: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.90.7173&rep=rep1&type=pdf

I wish more people had taken more lessons from Niklaus Wirth when designing
the programming languages and operating systems that turned out to
dominate the computer systems of today.

