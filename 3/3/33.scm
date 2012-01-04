;; averager

(define (averager a b c)
  (let ((s (make-connector))
        (n (make-connector)))
    (adder a b s)
    (multiplier c n s)
    (constant 2 n)
    'ok))

;; tests

(load "33_primitives.scm")
(load "33_connector.scm")

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))
(averager a b c)
(probe 'a a)
(probe 'b b)
(probe 'c c)

(set-value! a 382 'user)
(set-value! b 2292 'user)
(forget-value! a 'user)

(set-value! c 1814.5 'user)