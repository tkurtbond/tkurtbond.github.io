.. title: Software Tools
.. slug: software-tools
.. date: 2024-07-03 09:59:31 UTC-04:00
.. tags: ratfor,pascal,swtools,software tools,p.j. plauger,brian w. kernighan,lbltools,fortran,vos
.. category: computer
.. link: 
.. description: 
.. type: text

When I was in college in the 1980s the school I was at used Digital
Equipment Corporation VAXes running VMS, and didn't have any Unix
machines.  I was quite interested in Unix and the Unix philosophy, but
was frustrated by my lack of access to Unix machines.  However,
Brian W. Kernighan and P. J. Plauger wrote a couple of books about
writing tools in the Unix style: :title:`Software Tools` was in
published in 1976 and used Fortran as its portable implementation
language, while :title:`Software Tools in Pascal` was published in
1981 and used Pascal.

.. image:: /images/swtools.jpeg

Here is a quote repeated on each book's cover:

    Good Programming is not learned from generalities, but by seeing
    how significant programs can be made clean, easy to read, easy to
    maintain and modify, human-engineered, efficient, and reliable, by
    the application of common sense and good programming practices.
    Careful study and imitation of good programs leads to better
    writing.

Both books worked through writing software tools that were simpler but
still useful versions of many of the standard Unix tools.

I got :title:`Software Tools in Pascal` because I knew Pascal better
than Fortran and worked through implementing each of the programs on
the college's VAX, which taught me a lot about programming and was
significant influence on me.  I later got :title:`Software Tools`
because I wanted to read the section on implementing the ratfor
processor which that book used to add additional control structures
unavailable in the Fortran of the day.

I was not the only person who was influenced by these books.
Deborah K. Scherrer, Dennis E. Hall, and Joseph S. Sventek at Lawrence
Berkeley National Laboratory with help from others greatly expanded
the set of programs from the book into an entire Virtual Operating
System (VOS), and founded the `Software Tools Users Group
<https://en.wikipedia.org/wiki/Software_Tools_Users_Group>`_ in 1976
to distribute it, eventually leading to ports on over 50 operating
systems.

Luckily for me VAX/VMS was one of those operating systems, and the
port appeared on various tapes distributed by DECUS, the Digital
Equipment Computer Users' Society.  Luckily MPL Corporation, where I
worked at the time, always got the DECUS tapes and had a Fortran
compiler, so I could install it there.  I found it a very useful and
usable computing environment.

Anyway, I retain a fondness for that software, known variously as
LBLTOOLS, LBL SWTOOLS, and LBL VOS, and have begun using the version
from the `DECUS VAX Languages & Tools SIG tape from 1986
<https://www.digiater.nl/openvms/decus/zips_vms_attributes/lt86a.zip>`_
again on the (emulated) VAX I maintain at work.  This gave me the
opportunity create a `PDF with the documentation </swtoolsman.pdf>`_
for that version, which I'm making available here for the curious.

    “I really enjoyed that book.  The first computer book I read where
    I thought my world was larger after reading it.” — C. Paul Bond
