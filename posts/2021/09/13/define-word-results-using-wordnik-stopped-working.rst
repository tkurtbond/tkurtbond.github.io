.. title: define-word results using wordnik stopped working
.. slug: define-word-results-using-wordnik-stopped-working
.. date: 2021-09-13 15:48:30 UTC-04:00
.. tags: emacs,define-word,wordnik
.. category: computer/emacs
.. link: 
.. description: 
.. type: text

I use `define-word`_, a package from melpa (DWM_), that looks up the
definition of a word online.  It uses `wordnik.com`_ by default.
Recently it stopped returning definitions.

.. _define-word: https://github.com/abo-abo/define-word
.. _DWM: https://melpa.org/#/define-word
.. _wordnik.com: http://wordnik.com/

I did a little digging, and it turns out that it works when
you visit the url with Chrome, but not if you just try to download it
with curl, or ``url-retrieve`` in Emacs. Adding a
“``User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 11_5_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36``”
with curl’s -H option made it work.

.. code:: bash

   curl -i -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 11_5_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36' http://wordnik.com/words/importunate

So I added a ``let`` in my advice for ``define-word`` that binds
``url-request-extra-headers`` to an alist with ``"User-Agent"`` as the
key and ``"Mozilla/5.0 (Macintosh; Intel Mac OS X 11_5_2)
AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63
Safari/537.36"`` as the value, and it works again.

My solution looks something like this (simplified from my actual advice,
which does other things too):

.. code:: emacs-lisp

   (defadvice define-word (around your-around-define-word activate)
     "Dynamically bind tkb-define-word-word to the word passed in."
     (let ((url-request-extra-headers
            '(("User-Agent" . "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_5_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36"))))
       ad-do-it))

I opened an issue_ on github, suggesting it might be a good idea to
add a simpler way to add a ``User-Agent:`` header around
``define-word--to-string``\ ’s call to ``url-retrieve-synchronously``.

.. _issue: https://github.com/abo-abo/define-word/issues/31

