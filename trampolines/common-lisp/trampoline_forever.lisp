;;; Recurse forever without running out of stack space.
(defun baz ()
  (format t "baz~%")
  #'foo)

(defun bar ()
  (format t "bar~%")
  #'baz)

(defun foo ()
  (format t "foo~%")
  #'bar)

(let ((f #'foo))
  (loop for i from 1 while (not (null f))
        do (progn
             (format t "trampoline call #~s~%" i)
             (setf f (funcall f)))))
