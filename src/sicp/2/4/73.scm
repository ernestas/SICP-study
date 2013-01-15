;; deriv, using data-directed dispatch

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

;; a

;; the deriv was rewritten
;; from "dispatch on type"
;; to "data-directed dispatch"

;; number? & same-variable? can not be assimilated
;; into the data-directed dispatch because
;; there is nothing to dispatch on
;; they will work the same for all types of data


;; b

(define (install-deriv-sum-package)
  ;; internal procedures
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  ;; interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  (put 'make '+ make-sum))

(define (install-deriv-product-package)
  ;; internal procedures
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))

  (define (deriv-product exp var)
    ((get 'make '+) (make-product (multiplier exp)
                                  (deriv (multiplicand exp) var))
                    (make-product (deriv (multiplier exp) var)
                                  (multiplicand exp))))

  ;; interface to the rest of the system
  (put 'deriv '* deriv-product)
  (put 'make '* make-product))


;; c

(define (install-deriv-exponentiation-package)
  ;; internal procedures
  (define (base e) (car e))
  (define (exponent e) (cadr e))
  (define (make-exponentiation b e)
    (cond ((=number? b 1) 1)
          ((=number? e 0) 1)
          ((=number? e 1) a)
          (else (list '** b e))))

  (define (deriv-exponentiation exp var)
    (let ((make-product (get 'make '*)))
      (make-product (make-product (exponent exp)
                                  (make-exponentiation (base exp)
                                                       (- (exponent exp) 1)))
                    (deriv (base exp) var))))

  ;; interface to the rest of the system
  (put 'deriv '** deriv-exponentiation)
  (put 'make '** make-exponentiation))


;; d

;; parameter order in all put & get procedure calls
;; will have to be changed from 'op type' to 'type op'
;; AND
;; definition of put & get remains the same
;;
;; OR
;;
;; parameter order only in get procedure calls
;; will have to be changed from 'op type' to 'type op'
;; AND
;; parameter order in get definition will have to be changed
;; from 'op type' to 'type op'


;; tests

;; put & get procedures
(load "73_put_get.scm")


(install-deriv-sum-package)
(install-deriv-product-package)
(install-deriv-exponentiation-package)

(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(* (** x 3) 2) 'x)
