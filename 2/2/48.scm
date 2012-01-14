;; segment constructor and selectors

(define (make-segment s-start s-end)
  (cons s-start s-end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))
