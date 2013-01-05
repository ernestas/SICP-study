;; mit-scheme

(load "70_weighted.scm")
(load "54_integers.scm")
(load "display_stream.scm")

(define cube
  (lambda (x) (* x x x)))

(define (weight-cubes-sum pair)
  (+ (cube (car pair))
     (cube (cadr pair))))

(define sorted-for-raj
  (weighted-pairs integers
                  integers
                  weight-cubes-sum))

;(display-stream sorted-for-raj 10)

(define (same-consecutive-weights s weight)
  (let ((a (stream-car s))
        (b (stream-car (stream-cdr s))))
    (if (= (weight a) (weight b))
        (cons-stream (weight a)
                     (same-consecutive-weights (stream-cdr s) weight))
        (same-consecutive-weights (stream-cdr s) weight))))

(define ramanujan-numbers
  (same-consecutive-weights sorted-for-raj weight-cubes-sum))

(display-stream ramanujan-numbers 5)
