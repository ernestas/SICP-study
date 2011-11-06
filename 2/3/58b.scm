;; deriv, variable?, same-variable?, =number?
(include "56_deriv.scm")

;; list-end

(define (list-end sequence) 
  (if (null? (cdr sequence)) 
      (car sequence) 
      sequence))

;; sum

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1)
              (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (sum? x) 
  (and (pair? x)
       (eq? (cadr x) '+)))

(define (addend s) (car s))
(define (augend s) (list-end (cddr s)))

;; product

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1)
              (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (product? x)
  (and (pair? x)
       (eq? (cadr x) '*)))

(define (multiplier p) (car p))
(define (multiplicand p) (list-end (cddr p)))

;; exponent

(define (make-exponentiation a b)
  (cond ((=number? a 1) 1)
        ((=number? b 0) 1)
        ((=number? b 1) a)
        (else (list a '** b))))

(define (exponentiation? e)
  (and (pair? e)
       (eq? (cadr e) '**)))

(define (base e) (car e))
(define (exponent e) (caddr e))

;; tests

;(deriv '(+ x 3) 'x)
(deriv '(x + 3) 'x)
;(deriv '(* x y) 'x)
(deriv '(x * y) 'x)

(newline)

;(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '((x * y) * (x + 3)) 'x)
;(deriv '(* x y (+ x 3)) 'x)
(deriv '(x * y * (x + 3)) 'x)

(newline)

;(deriv '(* (** x 3) 2) 'x)
(deriv '((x ** 3) * 2) 'x)

(newline)

(deriv '(x + 3 * (x + y + 2)) 'x)