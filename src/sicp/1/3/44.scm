(define (compose-cust f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose-cust f (repeated f (- n 1)))))

(define (average a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
             (f x)
             (f (+ x dx)))))

(define (smooth-nth-fold f n)
  (repeated smooth n) f)
