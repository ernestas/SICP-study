(define (cycle? x)
  (define (iter slow fast)
    (cond ((null? fast) #f)
          ((eq? slow fast) #t)
          (else (iter (cdr slow)
				      (cddr fast)))))
  (iter x (cdr x)))

;; tests

(define t '(a b c))
(cycle? t)

(define f '(a b c))
(set-car! f (cddr f))
(cycle? f)

(define s '(a b c))
(set-car! s (cdr s))
(set-car! (cdr s) (cddr s))
(cycle? s)

(define i '(a b c))
(set-car! i i)
(cycle? i)

(newline)

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define z (make-cycle '(a b c)))
(cycle? z)
