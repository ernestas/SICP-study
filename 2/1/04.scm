;; FUN

(define (cons-cust x y)
  (lambda (m) (m x y)))

(define (car-cust z)
  (z (lambda (p q) p)))

;; proof

(define x 1)
(define y 2)

(car-cust (cons-cust x y))
; (car (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; x

;; cdr

(define (cdr-cust z)
  (z (lambda (p q) q)))

(cdr-cust (cons-cust x y))