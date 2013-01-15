;; ******
;; square

(define (square x) (* x x))

;; ********************
;; apply-generic & tags
(load "87_apply_generic_and_tags.scm")

;; ******************
;; generic arithmetic

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x))



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
  (put 'equ? '(integer integer) (lambda (x y) (= x y)))
  (put '=zero? '(integer) (lambda (x) (= x 0)))
  (put 'make 'integer (lambda (i) (tag i)))
  (put 'raise '(integer) integer->rational)
  'done)

;; *********************************
;; integer-package exposed to public

(define (make-integer i)
  ((get 'make 'integer) i))



;; ******************
;; polynomial-package

(define (install-polynomial-package)
  ;; internal procedures
  ;; representation of poly
  (define (=zero-p? p)
    (empty-termlist? (term-list p)))

  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))

  (define (variable? x) (symbol? x))
  (define (same-variable? v1 v2)
    (and (variable? v1)
         (variable? v2)
         (eq? v1 v2)))

  ;; representation of terms and term lists
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))

  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
          ((empty-termlist? L2) L1)
          (else (let ((t1 (first-term L1)) (t2 (first-term L2)))
                  (cond ((> (order t1) (order t2))
                         (adjoin-term t1
                                      (add-terms (rest-terms L1) L2)))
                        ((< (order t1) (order t2))
                         (adjoin-term t2
                                      (add-terms L1 (rest-terms L2))))
                        (else (adjoin-term (make-term (order t1)
                                                      (add (coeff t1)
                                                           (coeff t2)))
                                           (add-terms (rest-terms L1)
                                                      (rest-terms L2)))))))))

  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
        (the-empty-termlist)
        (add-terms (mul-term-by-all-terms (first-term L1) L2)
                   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
        (the-empty-termlist)
        (let ((t2 (first-term L)))
          (adjoin-term
           (make-term (+ (order t1) (order t2))
                      (mul (coeff t1) (coeff t2)))
           (mul-term-by-all-terms t1 (rest-terms L))))))

  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (add-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- ADD-POLY" (list p1 p2))))

  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (mul-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- MUL-POLY" (list p1 p2))))

  ;; interface to rest of the system

  (define (tag p) (attach-tag 'polynomial p))
  (put '=zero? '(polynomial) =zero-p?)
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  'done)

;; ************************************
;; polynomial-package exposed to public

(define (make-polynomial var terms)
  ((get 'make 'polynomial) var terms))



;; *****
;; tests

;; put & get procedures
(load "../4/73_put_get.scm")

(install-integer-package)
(install-polynomial-package)

(newline)

(define p1 (make-polynomial 'x '((2 2) (1 3) (0 1))))
(define p2 (make-polynomial 'x '((1 5) (3 2) (1 3))))
(define p3 (make-polynomial 'x '((3 6) (1 4) (2 3))))

(add p1 p2)
(add p2 p3)
(add p3 p1)

(newline)

(define pp1 (make-polynomial 'y (list (list 3 p1)
                                      (list 2 p2)
                                      (list 1 p3))))
(define pp2 (make-polynomial 'y (list (list 3 p3)
                                      (list 2 p2)
                                      (list 1 p1))))

(add pp1 pp2)
