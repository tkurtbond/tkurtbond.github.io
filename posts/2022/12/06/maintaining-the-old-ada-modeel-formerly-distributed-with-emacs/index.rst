.. title: Maintaining the old ada-mode.el formerly distributed with Emacs
.. slug: maintaining-the-old-ada-modeel-formerly-distributed-with-emacs
.. date: 2022-12-06 13:28:59 UTC-05:00
.. tags: ada,ada-mode,ada-mode.el,emacs
.. category: computer/ada
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: app
.. role:: cmd

I wrote a post_ about using the old ada-mode.el that used to be
distributed with :app:`Emacs` because I couldn't get the newer,
separate package version_ to work for me.

.. _post: link://slug/using-the-old-version-of-ada-mode-for-emacs
.. _version: https://www.gnu.org/software/emacs/manual/html_mono/ada-mode.html

Well, this morning when I pulled up an Ada file in :app:`Emacs` version
28 there were two problems:

#.  The information to invoke ada-mode on Ada files was not in the
    ``auto-mode-alist`` variable in :app:`Emacs`.  That was easy
    enough to fix: add :file:`.ada`, :file:`.ads`, and :file:`.adb` to
    ``auto-mode-alist`` (and :file:`.gpr`, too, since Ada mode works
    for :app:`gprbuild` files as well):

    .. code:: emacs-lisp

       (cl-loop for ext in '("\\.gpr$" "\\.ada$" "\\.ads$" "\\.adb$")
         do (add-to-list 'auto-mode-alist (cons ext 'ada-mode)))

    That was easy enough.

#.  When I tried to do any indentation :cmd:`emacs` reported an error,
    with the error message “End position is smaller than start
    position”.  Eventually I tracked this down to a call to
    ``parse-partial-sexp`` in ``ada-in-open-paren-p``.  It turns out
    that somewhere after :app:`Emacs` version 27.2 was released the
    :app:`Emacs` developers added a check to ``parse-partial-sexp`` to
    ensure that the ``FROM`` argument (which indicates where in the
    buffer to start parsing) was less than the ``TO`` argument (which
    indicates where in the buffer to **stop** parsing).

Drat.  Drat.  Drat.  Well, looking at the code it was clear that
since ``ada-in-open-paren-p`` is explicitly searching backwards
that ``TO`` would **always** be smaller than ``FROM``.  So I could
just transpose the s-expressions that found those two values.  I
tried it, and it worked!

At that point I realized that I had committed to maintain the old
version of ada-mode, at least for myself, and that I'd already talked
about it on my blog and it was small step from there to setting up a
GitHub repository_ with the old code, adding an issue_ describing the
problem, adding a commit_ with the fix, and then writing this blog
post.

.. _repository: https://github.com/tkurtbond/old-ada-mode
.. _issue: https://github.com/tkurtbond/old-ada-mode/issues/1
.. _commit: https://github.com/tkurtbond/old-ada-mode/commit/7ee6fe55862ec615c7fe23d881adfee2d0094770

Somewhere, someone is laughing and enjoying the schadenfreude.  Maybe
this will help someone else.

And since I already have a GitHub repository_, I ought to document the
first problem_ and since it is a documentation problem, put a mention
in the README_.

.. _problem: https://github.com/tkurtbond/old-ada-mode/issues/2
.. _README: https://github.com/tkurtbond/old-ada-mode/commit/67a79caacd851120fee2bca4704938a2f27e1bba
