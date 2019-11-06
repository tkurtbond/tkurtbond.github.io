.. title: E-mail Crisis, part 2
.. slug: e-mail-crisis-part-2
.. date: 2008-09-06 02:24:16 UTC-05:00
.. tags: e-mail,computer,tools,emacs
.. category: computer
.. link: 
.. description: 
.. type: text


I'm still having my personal e-mail crisis.

I said, earlier_,

    Anyway, I've finally come up with a way to switch back and forth
    between Gnus, Mew, and MH-E while keeping up with my current
    e-mail[…].

.. _earlier: link://slug/e-mail-crisis

That was a bit premature.  What I should have said was that I'd found
a way to make sure I didn't lose any e-mail permanently when switching
back and fourth between e-mail clients.  I'm using maildrop_ to copy
my incoming mail to the normal mail spool file and to a separate
archive mail file for each day. So, for instance, all the mail I got
on 2008/09/05 is archived in the mbox-format file
``~/Inboxes/2008-09-05.inbox``.

.. _maildrop: http://www.courier-mta.org/maildrop/

I also said, earlier_

    Wanderlust_ seems moribund.

It turns out that Wanderlust only *seems* moribund, especially to those
who only speak English.  If you check the mailing lists there's still
some activity, and if you poke around on the Wanderlust site you can
find_ a newer snapshot.  Unfortunately, Wanderlust uses several other
libraries (APEL_, FLIM_, and SEMI_) and these are also hard to find
much information about if you only speak English.  So I've been
fiddling around with it, and have figured out enough to get it working
for me.  (Thank goodness for the FreeBSD_ ports_ system.) 

.. _Wanderlust: http://www.gohome.org/wl/
.. _find: ftp://ftp.jpl.org/wl/snapshots/
.. _APEL: http://www.kanji.zinbun.kyoto-u.ac.jp/~tomo/elisp/APEL/
.. _FLIM: http://www.kanji.zinbun.kyoto-u.ac.jp/~tomo/elisp/FLIM/index.html.ja.iso-2022-jp
.. _SEMI: http://www.kanji.zinbun.kyoto-u.ac.jp/~tomo/elisp/SEMI/index.html.ja.iso-2022-jp
.. _FreeBSD: http://www.freebsd.org/
.. _ports: http://www.freebsd.org/ports/index.html

Oddly enough, although Wanderlust mostly understands MH-format
mailboxes, there seems to be no built-in way to get it to read mail
out of a standard mbox-format spool file and into your inbox.  I guess
the assumption is that if you're not using IMAP then you've probably
moved on to using a maildir-format spool file, since they're supposed
to be more reliable.

Well, I'm not.  I'm trying to compare Wanderlust, MH-E_, and Mew_, and
MH-E doesn't understand maildir-format mailboxes, so I have to stick
to mbox-format.  (Ok, I suppose I could mung things so MH-E uses Mew's
``incm`` to read the spool file.)

.. _MH-E: http://mh-e.sourceforge.net/
.. _Mew: http://www.mew.org/

Moreover, I've got a fairly odd pattern of e-mail folders.  For years
in VM_ I've saved my e-mail in in separate folders with names like
``2008/08/users.bond_tk`` or ``2008/08/list.clisp``, with VM
defaulting the folder names automatically.  I think I've mostly
figured out how to do this in MH-E, Mew, and Wanderlust, and I've
mostly figured out how to get the three of them to coexist peacefully,
so I can really give them a good comparison.  We'll see how it goes.

.. _VM: http://www.nongnu.org/viewmail/

Like many Emacs subsystems, the Emacs e-mail clients tend to use modes
with single-character commands for many things, and most the commands
are just regular keys, not key combinations.  I've gotten so used to
this that I find using e-mail clients that require mousing to be
extremely painful.  Moreover, I've become very accustomed to being
able to customize my e-mail client extensively using Lisp.

What it all boils down to is that I'm not happy unless my e-mail
client is part of Emacs.
