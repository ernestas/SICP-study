(define (squarer a b)
  (multiplier a a b))

;; tests

(load "33_primitives.scm")
(load "33_connector.scm")

(define a (make-connector))
(define b (make-connector))
(squarer a b)
(probe 'a a)
(probe 'b b)

(set-value! a 2 'user)
(forget-value! a 'user)

;; doesn't work because squarer passes only one parameter 'b' to multiplier
;; for multiplier to work at lest 2 parameters must be passed in
(set-value! b 4 'user)