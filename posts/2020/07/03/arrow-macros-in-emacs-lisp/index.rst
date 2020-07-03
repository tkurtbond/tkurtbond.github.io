.. title: Arrow Macros in Emacs Lisp
.. slug: arrow-macros-in-emacs-lisp
.. date: 2020-07-03 14:11:16 UTC-04:00
.. tags: arrow macros,emacs lisp,emacs,clojure,common lisp,unicode
.. category: computer/emacs
.. link: 
.. description: 
.. type: text

.. role:: file
.. role:: key(literal)

Are you familiar with arrow macros?  (They have nothing to do with
`arrows in Haskell`__.) They started out in Clojure_, I think, and have
been ported to `Common Lisp`_ and probably other Lisps, though I didn't
find one for `Emacs Lisp`_.  I think the arrows_ package is the most up
to date in Quicklisp_ for `Common Lisp`_, but I found the cl-arrows_
package first so that's the one I converted to `Emacs Lisp`_ today.

__ https://en.wikibooks.org/wiki/Haskell/Understanding_arrows
.. _Clojure: https://clojure.org/
.. _Common Lisp: https://en.wikipedia.org/wiki/Common_Lisp
.. _arrows: https://github.com/Harleqin/arrows
.. _cl-arrows: https://github.com/nightfly19/cl-arrows
.. _Quicklisp: https://www.quicklisp.org/
.. _Emacs Lisp: https://www.gnu.org/software/emacs/manual/html_node/elisp/

There were two slightly tricky parts to the port

- I needed to use lexical binding for the source file
- cl-arrows_\'s test suite used fractions, but `Emacs Lisp`_ doesn't
  have them.

Anyway, I think they're very useful.  If you have a value and
you want it to be processed by several functions in a chain you
can use an arrow macro instead of using lots of nested function
calls. For instance,  

.. code:: emacs-lisp

   (replace-regexp-in-string "-+$" "" (replace-regexp-in-string "^-+" "" (replace-regexp-in-string "^-+" "" (replace-regexp-in-string "\\.+" "." (replace-regexp-in-string "\\.-" "." (replace-regexp-in-string "-\\." "." (replace-regexp-in-string "-+" "-" (replace-regexp-in-string "[^-.a-z0-9]+" "-" string))))))))

is annoying and hard to read on one line.  If you split it into multiple lines

.. code:: emacs-lisp

   (replace-regexp-in-string
    "-+$" ""
    (replace-regexp-in-string
     "^-+" ""
     (replace-regexp-in-string
      "^-+" ""
      (replace-regexp-in-string
       "\\.+" "."
       (replace-regexp-in-string
        "\\.-" "."
        (replace-regexp-in-string
         "-\\." "."
         (replace-regexp-in-string
          "-+" "-"
          (replace-regexp-in-string "[^-.a-z0-9]+" "-"
   string))))))))

that's also pretty horrible.  To read it you have to skip to the end,
figure out that function call, then skip back to the next function
call, and so forth, until you get back to the last function call,
reading it from inside out.  It looks much better if you use the
``->>`` arrow macro, which substitutes the value you are passing along
as the last argument to the functions you are calling:

.. code:: emacs-lisp

   (->> string
        (replace-regexp-in-string "[^-.a-z0-9]+" "-")
        (replace-regexp-in-string "-+" "-")
        (replace-regexp-in-string "-\\." ".")
        (replace-regexp-in-string "\\.-" ".")
        (replace-regexp-in-string "\\.+" ".")
        (replace-regexp-in-string "^-+" "")
        (replace-regexp-in-string "-+$" ""))


I also think it is more understandable than the highly nested calls,
since you can follow along in from start to finish, rather than from
inside out: you've got the value, you pass it to the first function,
then to the second, and so forth.

There are also macros to insert the value at the front of the argument
list (``->``) and to insert the value where a ``<>`` symbol is found
(``-<>``).

I wrote some `Emacs Lisp`_ code with the last expression above today, and
I think it makes a good example of why they are useful.

Here's the use case that inspired me to port them to `Emacs
Lisp`_.  When I save things from the internet I often want to
create a directory to save them in based on the filename or
some text on a web page or something, but usually there are
spaces or special characters in that text, so I have to
sanitize the text to make it a safe and simple filename.  So I
need to replace all special characters with dashes.  But I
don't want dashes repeated multiple times, just a single dash,
and I don't want dashes followed or preceded by periods, only
the period.

Here' s some code to do that:

.. code:: emacs-lisp

   (defun tkb-sanitize-for-filename (string)
     "Clean up characters in STRING that aren't good for
   filenames."
     (->> string
          (replace-regexp-in-string "[^-.a-z0-9]+" "-")
          (replace-regexp-in-string "-+" "-")
          (replace-regexp-in-string "-\\." ".")
          (replace-regexp-in-string "\\.-" ".")
          (replace-regexp-in-string "\\.+" ".")
          (replace-regexp-in-string "^-+" "")
          (replace-regexp-in-string "-+$" "")))

   (defun tkb-sanitize-kill-for-filename (string)
     "Clean up characters that aren't good for filenames in the
   top of the kill
   ring and put the result on the top of the kill ring."
     ;; gets the kill or the system clipboard if it is new.
     (interactive (list (current-kill 0 t)))
     (let ((new-string (tkb-sanitize-for-filename string)))
       (message "Old string: %s\nNew String: %s" string new-string)
       (kill-new new-string)))

   (global-set-key (kbd "C-c k S") 'tkb-sanitize-kill-for-filename)

Note that the function ``tkb-sanitize-kill-for-filename`` that I use
interactively gets uses ``(current-kill 0 t)`` because it either
returns the top of the kill ring, or if the system clipboard is newer
it puts that on top of the kill ring and returns it.  (The docstring
of ``current-kill`` makes that a little difficult to figure out.)

So if I have the name of a product as
``"***Flashy####Product%%%%Name!!!!"`` I copy that to the clipboard
with :key:`⌘-C`, switch to emacs, do :key:`C-c k S`, switch back to
whatever program is saving the file, and use the generated,
sanitized name ``Flashy-Product-Name`` with :key:`⌘-V`.  Nifty!  

(And if you've ever wondered what the Unicode_ character for the Mac
keyboard `Command key`__ (⌘) is, it is the PLACE OF INTEREST SIGN, and you
can enter it by C-x 8 RETURN PLACE OF INTEREST SIGN.  The symbol they
use for for the key labeled alt and option__ (⌥) is the Unicode OPTION
KEY, and the symbol they use for the `Shift Key`__ (⇧) is UPWARDS WHITE ARROW.
I'm surprised they don't have a special symbol for Control__, but it
looks like they just use the plain ASCII ^, known in Unicode as
CIRCUMFLEX ACCENT.)

.. _Unicode: https://en.wikipedia.org/wiki/Unicode

__ https://en.wikipedia.org/wiki/Command_key
__ https://en.wikipedia.org/wiki/Option_key
__ https://en.wikipedia.org/wiki/Shift_key
__ https://en.wikipedia.org/wiki/Control_key

Anyway, here_\'s a ZIP_ file with the Emacs Lisp source for the arrow
macros so you can use them if you've been convinced of their
usefulness by this post.  It also has some minimal documentation in
the :file:`README.md` that came from the :file:`README.md` from
`cl-arrows`_, which seems to repeat the information from the
docstrings for the macros.

.. _here: /arrows-for-emacs.zip
.. _ZIP: https://en.wikipedia.org/wiki/Info-ZIP
