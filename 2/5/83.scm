;; integer-package

(define (install-integer-package)
  
  (define (integer->rational i)
    (make-rational i 1))
  
  (put 'raise '(integer) integer->rational))

;; rational-package

(define (install-rational-package)
  
  (define (rational->real r)
    (make-real (exact->inexact (/ (numer r)
                                  (denom r)))))
  
  (put 'raise '(rational) rational->real))
  
;; real-package

(define (install-real-package)
  
  (define (real->complex r)
    (make-complex-from-real-imag r 0))
  
  (put 'raise '(real) real->complex))



;; raise-generic

(define (raise-generic n)
  (apply-generic 'raise n))