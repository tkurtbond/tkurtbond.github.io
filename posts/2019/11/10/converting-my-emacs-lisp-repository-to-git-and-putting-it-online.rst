.. title: Converting my emacs-lisp repository to GIT and putting it online
.. slug: converting-my-emacs-lisp-repository-to-git-and-putting-it-online
.. date: 2019-11-10 14:09:17 UTC-05:00
.. tags: emacs lisp,git,mercurial,conversion
.. category: computer
.. link: 
.. description: 
.. type: text

I've had a mercurial_ repository for my Emacs Lisp initialization
files since Thursday, Oct 29, 2009, but had actually used it very
little.  Recently I had occasion to untangle my initialization files
somewhat — they had over 12,000 lines of code when I started, and I've
reduced that to 6,137 lines and switched over to using Elpa_ packages
for as much stuff as I can.

I decided I'd put it in one of the online repositories, and since I'm
already using `github.com`_ for my blog I decided to put it there_.
But that meant converting it to GIT_.  I used the directions here_
using fast-export_ which seemed to work fine.

.. _mercurial: https://www.mercurial-scm.org/
.. _Elpa: https://elpa.gnu.org/
.. _`github.com`: https://github.com/tkurtbond
.. _there: https://github.com/tkurtbond/emacs-lisp
.. _GIT: https://git-scm.com/
.. _here: https://git-scm.com/book/en/v2/Git-and-Other-Systems-Migrating-to-Git#_mercurial
.. _fast-export: https://github.com/frej/fast-export
