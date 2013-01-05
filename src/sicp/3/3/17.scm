(define (count-pairs x)
  (let ((aux '()))
    (define (count z)
      (cond ((not (pair? z)) 0)
            ((member z aux) 0)
            (else (if (null? aux)
                      (set! aux (list z))
                      (set-cdr! (last-pair aux) (list z)))
                  (+ (count (car z))
                     (count (cdr z))
                     1))))
    (count x)))

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

;; tests

(define t '(a b c))
(count-pairs t)

(define f '(a b c))
(set-car! f (cddr f))
(count-pairs f)

(define s '(a b c))
(set-car! s (cdr s))
(set-car! (cdr s) (cddr s))
(count-pairs s)

(define i '(a b c))
(set-car! i i)
(count-pairs i)
