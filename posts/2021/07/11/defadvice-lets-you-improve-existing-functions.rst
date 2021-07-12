.. title: defadvice lets you improve existing functions!
.. slug: defadvice-lets-you-improve-existing-functions
.. date: 2021-07-11 22:28:21 UTC-04:00
.. tags: 
.. category: computer/emacs
.. link: 
.. description: 
.. type: text

.. role:: file

I used ``defadvice`` in emacs lisp and it made the world so much
better!

Specifically, I use the function ``smart-unicode-hyphen`` from
:file:`xmlunicode.el` [#tkb-smart-unicode-mode]_ when entering text
that is to be typeset.  The first time you hit hyphen it inserts a
hyphen.  The second time you hit hyphen it changes it to an em dash.
The third time you hit hyphen it changes it to an en dash.  If you hit
it again it changes it back to a hyphen.  Unfortunately, I’ve never
found a monospaced font that has em dashes and en dashes that are
distinguishable from hyphens visually.  (Not to mention the minus
character, which is also important to enter correctly for
typesetting.)  So it is hard to tell what character you have just
inserted, especially since you have to remember which comes after
which in the sequence.

.. [#tkb-smart-unicode-mode]

   Specifically, I have a very small minor mode that makes hyphens,
   double and single quotes, and periods smart, so they insert the
   proper Unicode characters in the right situations. 

But I have a function tkb-describe-character that looks up the
character under the cursor (or before, if you specified a prefix
interactively or a value when called non-interactively) that looks up
the character in the variable unicode-character-list (which is defined
in :file:`unichars.el`) and contains the character values and unicode
names for the characters.

So, I wrote defadvice that runs ``(tkb-describe-character t)`` after
``smart-unicode-hyphen`` runs, so it looks at the character just
before it and describes it, so I know what it is!

It works wonderfully!

That's the thing about ``defadvice``: it lets you customize functions
to better adapt them to how you need to work.  Another way emacs lets
you customize it to better suit your needs.

I got my copies of :file:`xmlunicode.el` (copyright 2003 by Norman
Walsh) and :file:`unichars.el` (unattributed) off the Internet long
ago.  It looks like you can get :file:`xmlunicode.el` from his
xmlunicode_ github repository, and it looks like the replacement for
:file:`unichars.el` is :file:`xmlunicode-character-list.el`.

.. _xmlunicode: https://github.com/ndw/xmlunicode

Here's my code:

.. code:: emacs-lisp

   ;; look at https://github.com/ndw/xmlunicode for xmlunicode.el and a way
   ;; to make something like unichars.el.  xmlunicode.el provides the 
   ;; "smart-unicode-*" functions.
   (load-library "xmlunicode")
   (load-library "unichars")

   (defun tkb-describe-character (before)
     "Describe the character after point (before if a prefix was specified)
   if it is a unicode character."
     (interactive "P")
     (let* ((char (if before (char-before) (char-after)))
            (info (assoc (encode-char char 'ucs) unicode-character-list))
            (info (cons (format "#x%X" (car info)) info)))
       (message "%S" info)))
   (tkb-keys ((kbd "C-c k d") #'tkb-describe-character))

   (define-minor-mode tkb-smart-unicode-mode
     "Toggle smart unicode punctuation" nil " ♻⚔☣☥☸◉⅙✽☮" ; "✘▧▧⚅☑☢☹☺♠♥♦♣♨"
     '(("\"" . unicode-smart-double-quote)
       ("'"  . unicode-smart-single-quote)
       ("-"  . unicode-smart-hyphen)
       ("."  . unicode-smart-period)))

   (defadvice unicode-smart-hyphen (after tkb-after-unicode-smart-hyphen last
                                          activate compile)
     (tkb-describe-character t))          

Here's a gist_, and the raw_ gist if you want to download it directly.

.. _gist: https://gist.github.com/tkurtbond/3dad54a2141422f39033533e72f53110
.. _raw: https://gist.githubusercontent.com/tkurtbond/3dad54a2141422f39033533e72f53110/raw/f1dc635d64fae89d1202142583df39544a87d7b8/tkb-smart-unicode-mode.el
