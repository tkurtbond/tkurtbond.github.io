.. title: SWTOOLS VOS shells need GRPNAM as well as CMEXEC and DETACH for subshells
.. slug: swtools-vos-shells-need-grpnam-as-well-as-cmexec-and-detach-for-subshells
.. date: 2024-07-19 12:03:19 UTC-04:00
.. tags: swtools vos,swtools ratfor,fortran,vax/vms,sh,hsh,esh,detach,cmexec,grpnam
.. category: computer/swtools
.. link: 
.. description: 
.. type: text

.. role:: command   

The SWTOOLS VOS provides three shells, :command:`sh`, :command:`hsh`
(which adds a history mechanism), and :command:`esh` (which adds
:command:`ed`\-style editing of the history).  The release notes state
that the shells need the privileges ``DETACH`` and ``CMEXEC``, but
under VMS 5.5-2 it turns out that they need the ``GRPNAM`` privilege
as well.
