(define (compose-cust f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose-cust f (repeated f (- n 1)))))

(define (square x) (* x x))

((repeated square 2) 5)
