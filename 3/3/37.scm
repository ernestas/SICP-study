(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c- x y)
  (let ((z (make-connector)))
    (adder z y x)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier z y x)
    z))

(define (cv x)
  (let ((z (make-connector)))
    (constant x z)
    z))

;; C --> F

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))

;; tests

(load "33_primitives.scm")
(load "33_connector.scm")

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))
(probe "C" C)
(probe "F" F)

(set-value! C 37.0 'user)

(forget-value! C 'user)

(set-value! F 98.6 'user)