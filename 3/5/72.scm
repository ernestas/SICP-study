;; mit-scheme

(load "70_weighted.scm")
(load "54_integers.scm")
(load "display_stream.scm")

(define square
  (lambda (x) (* x x)))

(define (weight-squares-sum pair)
  (+ (square (car pair))
     (square (cadr pair))))

(define sorted-for-72
  (weighted-pairs integers
                  integers
                  weight-squares-sum))

;(display-stream sorted-for-72 10)

(define (same-3-consecutive-weights s weight)
  (let ((a (stream-car s))
        (b (stream-car (stream-cdr s)))
        (c (stream-car (stream-cdr (stream-cdr s)))))
    (if (= (weight a) (weight b) (weight c))
        (cons-stream (list (weight a) a b c)
                     (same-3-consecutive-weights (stream-cdr s) weight))
        (same-3-consecutive-weights (stream-cdr s) weight))))

(define 72-numbers
  (same-3-consecutive-weights sorted-for-72 weight-squares-sum))

(display-stream 72-numbers 5)
