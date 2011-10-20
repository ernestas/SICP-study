;; ********************
;; apply-generic & tags
(include "78_apply_generic_and_tags.scm")

;; ******************
;; generic arithmetic

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))



;; *********************
;; scheme-number-package

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  'done)

(define (make-scheme-number n) 
  ((get 'make 'scheme-number) n))



;; *****
;; tests

;; put & get procedures
(include "73_put_get.scm")


(install-scheme-number-package)

(define a (make-scheme-number 5))
(define b (make-scheme-number 3))

(add a b)
(add 3 5)