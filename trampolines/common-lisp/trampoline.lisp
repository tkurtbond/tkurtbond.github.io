;;; Demonstrate lisp-style trampolines.
(defun baz ()
  (format t "baz~%")
  nil)

(defun bar ()
  (format t "bar~%")
  #'baz)

(defun foo ()
  (format t "foo~%")
  #'bar)

(let ((f #'foo))
  (loop for i from 1 while (not (null f))
        do (setf f (funcall f))))
