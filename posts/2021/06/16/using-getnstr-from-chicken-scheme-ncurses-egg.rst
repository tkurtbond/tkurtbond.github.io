.. title: Using getnstr from Chicken Scheme ncurses egg
.. slug: using-getnstr-from-chicken-scheme-ncurses-egg
.. date: 2021-06-16 14:57:28 UTC-04:00
.. tags: chicken scheme,scheme
.. category: computer/languages/lisp/scheme
.. link: 
.. description: 
.. type: text

The `Chicken Scheme`_ documentation for the `ncurses egg`_ says that
you should pass a string to the ``getnstr``, function, but that doesn't
actually work.

.. _Chicken Scheme: https://www.call-cc.org/
.. _ncurses egg: http://wiki.call-cc.org/eggref/5/ncurses


I finally found an example_, and after looking at it and figuring out
what imports are now required I have a working example of using
getnstr from the chicken scheme ncurses egg!

.. _example: https://stackoverflow.com/a/45359136 



.. code:: scheme

   (import ncurses)
   (import (chicken locative))
   (import (chicken string))

   (define (get-string max)
     (let ((buffer (make-string max #\null)))
       (getnstr (make-locative buffer) max)
       ;; Delete the #\null characters.
       (string-translate buffer #\null)))

   (let ((stdscr (initscr))
         (str (get-string 10)))
     (addstr str)
     (getch)
     (write str)
     (endwin))

     
Oh, and I added the example to the ncurses egg documentation: `getnstr
Example`_.

.. _getnstr Example: http://wiki.call-cc.org/eggref/5/ncurses#getnstr-example
