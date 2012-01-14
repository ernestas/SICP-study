(define (compose-cust f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose-cust square inc) 6)
