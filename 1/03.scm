(define (square x)
  (* x x))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (sum-of-two-biggest-squares a b c)
  (sum-of-squares (max a b) (max c (min a b))))