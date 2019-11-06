.. title: E-mail Crisis
.. slug: e-mail-crisis
.. date: 2008-08-05 10:38:04 UTC-05:00
.. tags: e-mail,computer,tools,emacs
.. category: computer
.. link: 
.. description: 
.. type: text


I've been having a personal e-mail crisis for the past couple of
months.  (If you've noticed that my e-mail has been even slower and
more erratic than usual, that's why.)  I've been trying to figure out
a better mail setup and due to my complicated use patterns it has been
tricky.

I have dialup Internet access at home, at speeds that are moderately
slow even for dialup.  I have a personal server elsewhere that does
have good internet access, and that's were my e-mail is delivered.  My
main work computer is a Windows XP laptop.  I often work at client
sites, and sometimes work at places that have no Internet access, or
very limited access with strict controls.  I need to read, or at least
refer to my e-mail at all those places.

For years I've used Emacs_ and ViewMail (aka VM_) to read my personal
e-mail, syncing my e-mail directories between my Internet server, my
home machine, and my work laptop with Unison_, and primarily reading
e-mail on my Internet server.  This has worked reasonably well.

I live in Emacs anyway (the Control key is the most worn key on my
keyboard for some reason…) and am thoroughly happy with it for editing
(and probably dependent on it), and VM has been very comfortable as
well.  However, development of VM went into hibernation after the
release of version 7.19, and so hadn't kept pace with later e-mail
developments.  Recently the original author of VM, `Kyle Jones`_,
handed over development to `Robert Widhopf-Fenk`_ and development has
picked up again, but it's still lacking some features that I need, and
unfortunately I don't have time to devote to adding them myself.

I can't imagine giving up Emacs for reading e-mail, since it
integrates so well with the rest of what I do and I enjoy using Emacs
and Emacs Lisp, so I'm looking for a new Emacs-based mail reader.  So
far I haven't been happy with any of my choices.

Back when I read USENET news regularly I used Gnus_ and loved it.  It
is distributed with Emacs and seems to have regular development and
maintenance.  In theory, Gnus can also be used to read e-mail, but
because of its news reader design it takes a very unconventional
approach to reading e-mail.  I'm not entirely comfortable with it, and
I haven't figured out the best way to integrate my huge archive of old
mail.  Moreover, the documentation is quirky and difficult and the
programming interfaces are quirky and complicated.

There are other Emacs mail readers.  I used RMAIL_ for a while before
I moved to VM, but I can't see moving back. Wanderlust_ seems
moribund.  I've used the RAND MH Message Handling System (MH_) in the
past, outside of Emacs, and there are a couple of modern versions of
that (nmh_, Mailutils_).  It turns out there are actually a couple of
extensive Emacs interfaces to it: Mew_ and MH-E_.  I've looked a
little at both, and have had some luck with each.  I'll have to see
how they compare over time.

I'd be interested in learning about any other Emacs-based e-mail
clients.  The EmacsWiki_ doesn't seem to have any other likely
prospects, though.

Anyway, I've finally come up with a way to switch back and forth
between Gnus, Mew, and MH-E while keeping up with my current e-mail, 
so I can search for better ways to deal with my old e-mail and
compare new email. I should be back to dealing with e-mail
quickly and effectively.

A **really** impressive and unlikely success would be to find a new
way of reading mail that lets me access my work e-mail, which is in
our corporate Notes e-mail system, from Emacs.

.. _Emacs: http://www.gnu.org/software/emacs/
.. _VM: http://www.wonderworks.com/vm/
.. _`Kyle Jones`: http://wonderworks.com/
.. _`Robert Widhopf-Fenk`: http://www.nongnu.org/viewmail/
.. _Gnus: http://gnus.org/
.. _RMAIL: http://www.gnu.org/software/emacs/manual/html_node/emacs/Rmail.html
.. _Mew: http://www.mew.org/
.. _Wanderlust: http://www.gohome.org/wl/
.. _Unison: http://www.cis.upenn.edu/~bcpierce/unison/
.. _MH: http://rand-mh.sourceforge.net/
.. _nmh: http://www.nongnu.org/nmh/
.. _Mailutils: http://www.gnu.org/software/mailutils/
.. _MH-E: http://mh-e.sourceforge.net/
.. _EmacsWiki: http://www.emacswiki.org/cgi-bin/wiki/CategoryMail
