.. title: Cobol and Fortran
.. slug: cobol-and-fortran
.. date: 2020-12-10 11:06:20 UTC-05:00
.. tags: cobol,fortran,ratfor
.. category: 
.. link: 
.. description: 
.. type: text

I know Cobol_, and have written it for work, but not for a long time,
maybe 30 years? No, I lie, I did some a decade or two ago.  It was not
my favorite programming language, but knowing it helped pay the
bills.  At my college in the mid-80s it was taught by the Business
department rather than the Computer Science department!

.. _Cobol: https://en.wikipedia.org/wiki/COBOL

One of my Cobol jobs was porting code from the IBM mainframes to VMS
on a Digital Equipment Corporation mini-computer, the VAX.  A more
recent one was fixing bugs and making enhancements to some student
management software at a nearby college.

What little Fortran I've written was in the ratfor_ (Rational Fortran)
dialect, on VMS, using the Software Tools package written at Lawrence
Berkeley Labs, which ported a lot of Unix tools to VMS (and IBM
mainframes) using ratfor (a dialect that was first invented on Unix to
add modern control structures to Fortran 66, and implemented
as a preprocessor).

.. _ratfor: https://en.wikipedia.org/wiki/Ratfor

One of my favorite programming books is `Software Tools`_ by Brian
Kernighan and P.J. Plauger (I first read the `Software Tools in
Pascal`_ version), which showed how to write Unix like tools
in Ratfor (because at the time Fortran was more portable than C!).  It
was the inspiration for the LBL Software tools package.  I wish I
still had the LBL Software Tools on the VAX I maintain (running on a
software emulator on Intel hardware, at much faster speeds than the
original VAX), but it was deleted to save space long ago in an era of
expensive hard drives, a decision I've long regretted!  I can find the
source online, but I can't find a binary distribution, and that VAX
doesn't have a Fortran compiler anymore, alas.

.. _Software Tools: https://www.amazon.com/Software-Tools-Brian-W-Kernighan/dp/020103669X/ref=sr_1_3
.. _Software Tools in Pascal: https://www.amazon.com/Software-Tools-Pascal-Brian-Kernighan/dp/0201103427/ref=sr_1_4
