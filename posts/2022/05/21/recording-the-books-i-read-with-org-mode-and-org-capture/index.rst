.. title: Recording the books I read with org-mode and org-capture
.. slug: recording-the-books-i-read-with-org-mode-and-org-capture
.. date: 2022-05-21 07:17:18 UTC-04:00
.. tags: reading,org-mode,emacs,org-capture,emacs advice,defadvice,advice-add
.. category: computer/emacs
.. link: 
.. description: 
.. type: text

.. role:: app

I used to record the books that I read on this blog__, but that took
too much effort__.  However, if I don't record the books I read, I
sometimes can't remember whether I read a particular book or not,
especially with Kindle Unlimited books.  (Was it the seventh book of
the series that I read last, or the eighth?)

__ link://tag/recent%20reading
__ link://slug/reading-but-not-recording

I record the books that I read in emacs__ using `org-mode`__ and —
since today — `org-capture`_.  Here's what the org file looks like:

__ https://www.gnu.org/software/emacs/
__ https://orgmode.org/
.. _org-capture: ttps://orgmode.org/manual/Capture.html

.. code::

  * 2022
  ** Read
  *** : Title of Book I Haven't Finished Reading -- https://www.amazon.com/amazon-book-link-if-it-exists
  ...
  *** 2022-05-21: Title of Book I **Have** Finished Reading -- https://www.amazon.com/amazon-book-link-if-it-exists
  ...
  ** Did not finish
  *** : Title of Book I Won't Finish Reading -- https://www.amazon.com/amazon-book-link-if-it-exists
  ...
  * 2021
  * Previously read, sometime
  ** Title of Book I Finished Reading at some indeterminate date in the past -- https://www.amazon.com/amazon-book-link-if-it-exists
  ...

I keep the org file in a :app:`git` repository hosted online so I can
edit it on whatever computer is close at hand, or on my cell phone.
(Having a :app:`git` client with a simple editor on my phone is
wonderful!)

When I start reading a book I create a new entry by selecting the
title and author of the book on its Amazon page, use the Chrome
extension Create Link to create a plain text link, which I then insert
into the org file at the right heading level and with a ``:␢`` (a
colon followed by a blank space) after the asterisks of the heading
and before the link.  When I'm done with reading the book I put the
`ISO 8601`__ date (*YYYY-MM-DD*) before the colon.

__ https://en.wikipedia.org/wiki/ISO_8601

I wrote a script today to count how many books I've read so far this
year:

.. code:: bash

   #! /usr/bin/env bash

   YEAR=$(date '+%Y')
   LAST_YEAR=$((YEAR - 1))

   sed -E -n "/^\* $YEAR/,/^(\*\* Did not finish|\* $LAST_YEAR)/p" $READ_FILE |
       sed -e "/^* $YEAR/d" -e "/^** Read/d" \
           -e "/^(\*\* Did not finish|\* $LAST_YEAR)/d" |
       sed -E -n "/^\*\*\*[ \t]+[0-9]/p" |
       wc -l

This gets all the lines for this year, or just up to the ones that I did not finish, if there are any yet, then gets read of the leading 

This works pretty well.

And so far I've read 227 books this year.

And then I got to thinking: I could probably use `org-capture`_ to
automate finding the file, finding the right place to insert the
information, and then copying the link from the clipboard and
inserting it along with the heading formation!

Here's the ``org-capture-templates`` value I use for this:

.. code:: emacs-lisp

   (setq org-capture-templates
         `(("b" "Add book about to read" entry
            (file+olp ,(expand-file-name "~/Repos/tkb-org/Books/read.org")
                      ,(format-time-string "%Y") "Read")
            "*** : %c" :prepend t)))   


You'll want to read `Capture templates`__ to understand how this works.

__ https://orgmode.org/manual/Capture-templates.html

Of course, then I thought: what if my :app:`emacs` session lasts from
one year into the other, and I then add a new book?  It will have the
wrong year!

And then I immediately thought of `Advising Emacs Lisp Functions`__!
(I feel old — it was the ``defadvice`` function when I started using
it.)

__ https://www.gnu.org/software/emacs/manual/html_node/elisp/Advising-Functions.html

So I added the following code:

.. code:: emacs-lisp

     (defvar tkb-org-year (format-time-string "%Y")
       "The year the current emacs session was started, for use with org-capture.")
     (defun tkb-org-capture-advice-update-year (&optional goto keys)
       "Update ‘tkb-org-year’ and update the entry for adding a book in 
   ‘org-capture-templates’ to use the new value."
       (let ((new-year (format-time-string "%Y")))
         (unless (string-equal tkb-org-year new-year)
           (setf tkb-org-year new-year)
           (setf (--> "b" (assoc it org-capture-templates)
                      (assoc 'file+olp it) (nth 2 it))
                 tkb-org-year))))
     (advice-add 'org-capture :before #'tkb-org-capture-advice-update-year)

I tested this by manually setting ``tkb-org-year`` to ``"2021"`` and
capturing a new book.  It worked fine!
