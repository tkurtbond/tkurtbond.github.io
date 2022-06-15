;;; Recurse forever, because with tail call optimization, the stack
;;; never runs out!
(define i 0)

(define (f)
  (set! i (+ 1 i))
  (display "call #") (display i) (newline)
  (f))

(f)
