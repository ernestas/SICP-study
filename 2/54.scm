;; equal?

(define (equal?-cust a b)
  (cond ((and (null? a) (null? b)) #t)
        ((eq? (car a) (car b)) (equal?-cust (cdr a) (cdr b)))
        (else #f)))

(define (equal?-cust-2 a b)
  (if (and (pair? a) (pair? b))
      (and (equal?-cust-2 (car a) (car b))
           (equal?-cust-2 (cdr a) (cdr b)))
      (eq? a b)))

;; tests

(equal?-cust '(this is a list) '(this is a list))
(equal?-cust '(this is a list) '(this (is a) list))

(newline)

(equal?-cust-2 '(this is a list) '(this is a list))
(equal?-cust-2 '(this is a list) '(this (is a) list))