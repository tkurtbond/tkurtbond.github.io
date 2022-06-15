;;; Recurse until the stack space runs out.
(defparameter i 0)

(defun f ()
  (incf i)
  (format t "call #~d~%" i)
  (f))

(f)
