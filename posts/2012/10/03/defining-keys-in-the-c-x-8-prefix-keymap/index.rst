.. title: Defining keys in the C-x 8 prefix keymap
.. slug: defining-keys-in-the-c-x-8-prefix-keymap
.. date: 2012-10-03 23:54:40 UTC-05:00
.. tags: emacs,emacs lisp,unicode,key translation
.. category: computer/emacs
.. link: 
.. description: 
.. type: text


Yay!  I finally found it!

Suppose you hate typing “C-x 8 RET GREEK SMALL LETTER LAMBDA” to
insert a lowercase lambda character in emacs (perhaps because you have
a dull American keyboard and aren't very savvy to input methods).  You
can add a key definition to the “C-x 8 prefix keymap”, say “gl”, so
you can type “C-x 8 g l” and insert a lowercase lambda.

Here's how you might do it for “λ”, “Λ”, and “§”::

    (load-library "iso-transl.el")
    (iso-transl-define-keys '(("gl" . [?λ])   ; greek lowercase lambda
                              ("gL" . [?Λ])   ; greek uppercase lambda
                              ("ps" . [?§]))) ; punctuation SECTION SIGN
