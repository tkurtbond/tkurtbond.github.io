.. title: E-mail Crisis, Part 4
.. slug: e-mail-crisis-part-4
.. date: 2008-09-10 01:05:39 UTC-05:00
.. tags: e-mail,emacs
.. category: computer
.. link: 
.. description: 
.. type: text


Well, it looks like a leader is slowly emerging in my quest for an
Emacs based mail reader: Wanderlust_

.. _Wanderlust: http://www.gohome.org/wl/

It handles MH- and Maildir-format mailboxes, UTF-8 in headers, has
good facilities for reading and composing MIME messages, and I finally
got it to work with Lotus Domino/Notes IMAP/SSL, amazingly.

Moreover, it looks like I'm probably going to switch to using a
Maildir-format mailbox, which will work well with my use of Unison_:
MH-format mailboxes' use of plain numbers for message IDs/filenames
(which can change a lot) makes things a little more confusing when
syncing mailboxes with Unison.

.. _Unison: http://www.cis.upenn.edu/~bcpierce/unison/

Moving away from MH-format mailboxes is a bit of a shame, since it
means that I'll be losing the ability to use the MH command line
programs for accessing my e-mail.  I've used MH in the past, and have
always liked the command line access it gives you.  Ah well.  I wish
mdmh had advanced further.
