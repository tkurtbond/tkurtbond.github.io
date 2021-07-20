.. title: FILETAP
.. slug: 2004-01-09
.. date: 2004-01-09 00:00:00 UTC-05:00
.. tags: old blog,vms,poise,filetap,dms-plus,spl
.. category: oldblog
.. link: 
.. description: 
.. type: text


.. role:: app
.. role:: file

I had to do some maintenance on the :app:`FILETAP` program today.
I last worked on it in 1988, as far as I can tell.  The last time it
was compiled was in 1990 (going by the file dates) but I doubt that
anybody had changed the code since 1988 when I last worked on it.
It's written to use the POISE SPL API, the Support Procedure Library.

As it turned out, the only reason it needed recompiled now is that one
of MPL's POISE users finally found a use for field-and-record level
security and the enhanced security features only work if the program
is linked against the shared library (:file:`.EXE`) and not the statically
linked library (:file:`.OLB`).  And the program required no code changes to
get it to work.

So where's the maintenance? It turns out that there are actually two
version of this program, :app:`TFILETAP` and :app:`FILETAP`,
and it's not obvious *why* there are two versions.  :app:`FILETAP`
is the version that appears to be used the most, but
:app:`TFILETAP` is slightly different (mostly because it opens the
key file for exclusive access).  Unfortunately, as I've lamented
several times in the past, we weren't using any sort of revision
control back then, much less configuration control, so there is no
history of changes, much less an explicit reason for the changes.  Oh
well.  I guess I'll have to look at it some more later.
