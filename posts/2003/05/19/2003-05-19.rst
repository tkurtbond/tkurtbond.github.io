.. title: More on VMS BASIC and Re-dimensioning Dynamically Allocated Arrays
.. slug: 2003-05-19
.. date: 2003-05-19 00:00:00 UTC-05:00
.. tags: old blog
.. category: oldblog
.. link: 
.. description: 
.. type: text

Monday, 19 May 2003
===================

As I mentioned `earlier <../../../log/2003/05/08.html#redim-vms-
basic>`__, VMS BASIC doesn't allow you to redimension dynamically
allocated arrays inside procedures that they have been passed to as
arguments.  One of the folks at HP saw my `post <http://groups.google.c
om/groups?q=tkb+group:comp.os.vms&hl=en&lr=&ie=UTF-8&oe=UTF-8&selm=a3d
b6b24.0305081211.6f867ad0%40posting.google.com&rnum=1>`__ about this
in comp.os.vms and passed it to a VMS BASIC engineer, who confirmed
that my workaround was reasonable and should work, which was good to
know, although I had tested it and it seemed to work fine.
