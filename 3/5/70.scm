;; mit-scheme

(load "70_weighted.scm")
(load "54_integers.scm")
(load "display_stream.scm")

;; a

(define (weight-sum pair)
  (+ (car pair)
     (cadr pair)))

(display-stream (weighted-pairs integers integers weight-sum) 10)

;; b

(define (weight-235 pair)
  (+ (* 2 (car pair ))
     (* 3 (cadr pair))
     (* 5 (car pair) (cadr pair))))

(define (divides? a b)
  (= (remainder a b) 0))

(define (does-not-divide-by-235? x)
  (and (not (divides? x 2))
       (not (divides? x 3))
       (not (divides? x 5))))

(define not-divisible-by-235
  (stream-filter does-not-divide-by-235?
                 integers))

(display-stream (weighted-pairs not-divisible-by-235
                                not-divisible-by-235
                                weight-235)
                10)
