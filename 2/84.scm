;; ******
;; square

(define (square x) (* x x))

;; *************
;; apply-generic

(define (apply-generic op . args)
  
  (define (no-method type-tags)
    (error "No method for these types"
      (list op type-tags)))
  
  (define (raise-into a b)
    "Tries to raise a into the type of b. On success,
    returns the raised a. Otherwise, returns #f"
    (let ((a-type (type-tag a))
          (b-type (type-tag b)))
      (cond ((equal? a-type b-type) a)
            ((not (eq? '()
                       (get 'raise (list a-type))))
             (raise-into (raise-generic a) b))
            (else #f))))
  
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if (not (eq? '() proc))
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((a1 (car args))
                    (a2 (cadr args)))
                (cond ((raise-into a1 a2)
                       (apply-generic op (raise-into a1 a2) a2))
                      ((raise-into a2 a1)
                       (apply-generic op a1 (raise-into a2 a1)))
                      (else (no-method type-tags))))
              (no-method type-tags))))))

(define (raise-generic n) (apply-generic 'raise n))

;; ****
;; tags

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum) (car datum))

(define (contents datum) (cdr datum))

;; ******************
;; generic arithmetic

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))



;; ***************
;; integer-package

(define (install-integer-package)
  ;; internal procedures
  (define (integer->rational i)
    (make-rational i 1))
  (define (tag x)
    (attach-tag 'integer x))
  ;; interface to the rest of the system
  (put 'add '(integer integer) (lambda (x y) (tag (+ x y))))
  (put 'sub '(integer integer) (lambda (x y) (tag (- x y))))
  (put 'mul '(integer integer) (lambda (x y) (tag (* x y))))
  (put 'div '(integer integer) (lambda (x y) (tag (/ x y))))
  (put 'make 'integer (lambda (i) (tag i)))
  (put 'raise '(integer) integer->rational)
  'done)

;; *********************************
;; integer-package exposed to public

(define (make-integer i)
  ((get 'make 'integer) i))



;; ****************
;; rational-package

(define (install-rational-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (define (add-rat x y) (make-rat (+ (* (numer x) (denom y))
                                     (* (numer y) (denom x)))
                                  (* (denom x) (denom y))))
  (define (sub-rat x y) (make-rat (- (* (numer x) (denom y))
                                     (* (numer y) (denom x)))
                                  (* (denom x) (denom y))))
  (define (mul-rat x y) (make-rat (* (numer x) (numer y))
                                  (* (denom x) (denom y))))
  (define (div-rat x y) (make-rat (* (numer x) (denom y))
                                  (* (denom x) (numer y))))
  (define (rational->real r) (make-real (exact->inexact (/ (numer r)
                                                           (denom r)))))
  ;; interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational) (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational) (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational) (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational) (lambda (x y) (tag (div-rat x y))))
  (put 'make 'rational (lambda (n d) (tag (make-rat n d))))
  (put 'raise '(rational) rational->real)
  'done)

;; **********************************
;; rational-package exposed to public

(define (make-rational n d)
  ((get 'make 'rational) n d))



;; ************
;; real-package

(define (install-real-package)
  ;; internal procedures
  (define (real->complex r)
    (make-complex-from-real-imag r 0))
  (define (tag x)
    (attach-tag 'real x))
  ;; interface to the rest of the system
  (put 'add '(real real) (lambda (x y) (tag (+ x y))))
  (put 'sub '(real real) (lambda (x y) (tag (- x y))))
  (put 'mul '(real real) (lambda (x y) (tag (* x y))))
  (put 'div '(real real) (lambda (x y) (tag (/ x y))))
  (put 'make 'real (lambda (r) (tag r)))
  (put 'raise '(real) real->complex)
  'done)

;; *********************************
;; real-package exposed to public

(define (make-real r)
  ((get 'make 'real) r))



;; ***************
;; complex package

(define (install-complex-package)
  ;; imported procedures from rectangular and polar packages
  (include "77_complex_rectangular.scm")
  (include "77_complex_polar.scm")
  (install-rectangular-package)
  (install-polar-package)
  (define (real-part z) (apply-generic 'real-part z))
  (define (imag-part z) (apply-generic 'imag-part z))
  (define (magnitude z) (apply-generic 'magnitude z))
  (define (angle z) (apply-generic 'angle z))
  (define (make-from-real-imag x y) ((get 'make-from-real-imag 'rectangular) x y))
  (define (make-from-mag-ang r a) ((get 'make-from-mag-ang 'polar) r a))
  ;; internal procedures
  (define (add-complex z1 z2) (make-from-real-imag (+ (real-part z1) (real-part z2))
                                                   (+ (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2) (make-from-real-imag (- (real-part z1) (real-part z2))
                                                   (- (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2) (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                                                 (+ (angle z1) (angle z2))))
  (define (div-complex z1 z2) (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                                                 (- (angle z1) (angle z2))))
  ;; interface to rest of the system
  (define (tag z) (attach-tag 'complex z))
  (put 'real-part '(complex) real-part)
  (put 'imag-part '(complex) imag-part)
  (put 'magnitude '(complex) magnitude)
  (put 'angle '(complex) angle)
  (put 'add '(complex complex)
       (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put 'sub '(complex complex)
       (lambda (z1 z2) (tag (sub-complex z1 z2))))
  (put 'mul '(complex complex)
       (lambda (z1 z2) (tag (mul-complex z1 z2))))
  (put 'div '(complex complex)
       (lambda (z1 z2) (tag (div-complex z1 z2))))
  (put 'make-from-real-imag 'complex
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'complex
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)

;; *************************
;; complex exposed to public

(define (make-complex-from-real-imag x y) ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a) ((get 'make-from-mag-ang 'complex) r a))



;; *****
;; tests

;; put & get procedures
(include "73_put_get.scm")

(install-integer-package)
(install-rational-package)
(install-real-package)
(install-complex-package)

(newline)

(define int (make-integer 2))
(define rat (make-rational 1 2))
(define real (make-real 3))
(define complex (make-complex-from-real-imag 3 4))

(add int int)
(add rat rat)
(add real real)
(add complex complex)

(newline)
(newline)

(add int rat)
(add rat int)
(add int real)
(add real int)
(add int complex)
(add complex int)

(newline)
(newline)

(add rat real)
(add real rat)
(add rat complex)
(add complex rat)

(newline)
(newline)

(add real complex)
(add complex real)