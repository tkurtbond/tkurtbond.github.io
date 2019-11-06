.. title: Fun with Emacs: eval-after-load*
.. slug: fun-with-emacs-eval-after-load
.. date: 2008-08-15 18:54:39 UTC-05:00
.. tags: emacs
.. category: computer/emacs
.. link: 
.. description: 
.. type: text


Ok, suppose you want to evaluate a particular bit of code 
after emacs loads a particular emacs-lisp file, but you want to pass
values of local variables into that code.  The function
``eval-after-load`` makes you quote the expression and doesn't 
allow passing values into the expression.  How about this?

.. class:: code

::

  (require 'cl)
  (defmacro* eval-after-load* (file varlist &rest body)
    "Like `eval-after-load', but bind variables according to VARLIST in 
  the current environment of the `eval-after-load' expression, not the
  environment when BODY is evaluated.  This allows easy passing of values 
  into BODY.
  Each element of VARLIST is a symbol (which is bound to the current value
  of that symbol) or a list (SYMBOL VALUEFORM) (which binds SYMBOL to the
  value of VALUEFORM in the environment of the `eval-after-load' expression."
    `(eval-after-load ,file
       '(let ,(loop for v in varlist
		    collect (if (symbolp v)
				`(,v ,(eval v))
			      `(,(car v) ,(eval (cadr v))))
		    into new-varlist
		    finally return new-varlist) ,@body)))
  (put 'eval-after-load* 'lisp-indent-function
       (1+ (get 'eval-after-load 'lisp-indent-function)))

Here's a contrived example which demonstrates when things happen.

.. class:: code

::

  (let ((f (make-temp-file "tkb-madness" nil ".el"))
	(x 1))
    (unwind-protect
	(progn 
	  (save-excursion
	    (let ((buf (find-file f)))
	      (insert (format "(y-or-n-p \"In the file '%s'! \")" f))
	      (save-buffer)
	      (kill-buffer buf)))
	  (y-or-n-p "This happens before the eval-after-load*")
	  (eval-after-load* f
	      (x
	       (y (y-or-n-p "This happens when the eval-after-load* is executed?"))
	       (z 2))
	    (y-or-n-p (format "x: %d y: %S z: %d" x y z))
	    (y-or-n-p "This happends during the delayed expressions"))
	  (y-or-n-p "This happens after the eval-after-load* expression")
	  (load f))
      (when (file-exists-p f) (delete-file f))))

You should see something like:

.. class:: code

::

  Wrote /tmp/tkb-madness88647vuE.el
  This happens before the eval-after-load*(y or n) 
  This happens when the eval-after-load* is executed?(y or n) 
  This happens after the eval-after-load* expression(y or n) 
  Loading /tmp/tkb-madness88647vuE.el (source)...
  In the file '/tmp/tkb-madness88647vuE.el'! (y or n) 
  x: 1 y: t z: 2(y or n) 
  This happends during the delayed expressions(y or n) 
  Loading /tmp/tkb-madness88647vuE.el (source)...done

(``y-or-n-p`` is used instead of ``message`` so you see each message when it 
happens.)

Does the ``eval-after-load*`` macro make sense?
