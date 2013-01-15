;; *************
;; apply-generic
;;
;; Not always it will be possible to coerce all arguments
;; to one of the existing arguments' type.
;; Sometimes there might be a type that all arguments can be coerced to,
;; but which is not one of the arguments' type.

(define (apply-generic op . args)

  ;; Returns a list of coerced arguments 'args' to type 'type'.
  (define (coerce-all args type)
    (if (null? args)
        '()
        (let ((proc (get-coercion (type-tag (car args)) type)))
          (if proc
              (cons (proc (car args))
                    (coerce-all (cdr args) type))
              (cons (car args)
                    (coerce-all (cdr args) type))))))

  (let ((type-tags (map type-tag args)))

    ;; Uses 'coerce-all' to coerce all to the first argument type.
    ;; If 'get' returns a procedure, it is applied to the arguments
    ;; else repeat this with all but first argument.
    (define (coerce-all-to-first types)
      (let ((first-type (car types)))
        (if (null? first-type)
            (error "No method for these types" (list op type-tags))
            (let ((first-type-args (coerce-all args first-type)))
              (let ((proc (get op (map type-tag first-type-args))))
                (if (not (eq? '() proc))
                    (apply proc (map contents first-type-args))
                    (coerce-all-to-first (cdr types))))))))

    (coerce-all-to-first type-tags)))

;; ****
;; tags

(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
        ((pair? datum) (car datum))
        (else (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (cond ((number? datum) datum)
        ((pair? datum) (cdr datum))
        (else (error "Bad tagged datum -- CONTENTS" datum))))

;; ******************
;; generic arithmetic

(define (add . args) (apply apply-generic (cons 'add args)))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

;; ******
;; square

(define (square x) (* x x))



;; *********************
;; scheme-number-package

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number scheme-number)
       (lambda (x y z) (tag (+ x y z))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  'done)



;; ***************
;; complex package

(define (install-complex-package)
  ;; imported procedures from rectangular and polar packages
  (load "77_complex_rectangular.scm")
  (load "77_complex_polar.scm")
  (install-rectangular-package)
  (install-polar-package)
  (define (real-part z) (apply-generic 'real-part z))
  (define (imag-part z) (apply-generic 'imag-part z))
  (define (magnitude z) (apply-generic 'magnitude z))
  (define (angle z) (apply-generic 'angle z))
  (define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))
  (define (make-from-mag-ang r a) ((get 'make-from-mag-ang 'polar) r a))
  ;; internal procedures
  (define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
                         (+ (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
                         (- (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                       (+ (angle z1) (angle z2))))
  (define (div-complex z1 z2)
    (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                       (- (angle z1) (angle z2))))
  ;; coercion
  (define (scheme-number->complex n)
    (make-complex-from-real-imag (contents n) 0))
  ;; coercion interface
  (put-coercion 'scheme-number 'complex scheme-number->complex)
  ;; interface to rest of the system
  (define (tag z) (attach-tag 'complex z))
  (put 'real-part '(complex) real-part)
  (put 'imag-part '(complex) imag-part)
  (put 'magnitude '(complex) magnitude)
  (put 'angle '(complex) angle)
  (put 'add '(complex complex)
       (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put 'add '(complex complex complex)
       (lambda (x y z) (tag (add-complex (add-complex (tag x)
                                                      (tag y))
                                         (tag z)))))
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

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))



;; tests

;; *****
;; put-coercion & get-coercion procedures
;; NOTE: not yet covered in the book
;; used solely for the purposes of testing
(define *coercion-table* (make-equal-hash-table))
(define (put-coercion type-from type-to proc)
  (hash-table/put! *coercion-table* (list type-from type-to) proc))
(define (get-coercion type-from type-to)
  (hash-table/get *coercion-table* (list type-from type-to) #f))

;; put & get procedures
(load "../4/73_put_get.scm")


(install-scheme-number-package)
(install-complex-package)

(define z (make-complex-from-real-imag 3 4))

(newline)

(add 2 2 2)
(add 2 2 z)
(add 2 z 2)
(add 2 z z)
(add z 2 2)
(add z 2 z)
(add z z 2)
(add z z z)
