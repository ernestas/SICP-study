(define (square x)
  (* x x))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (max-of-two a b)
  (if (< a b)
      b
      a))

(define (min-of-two a b)
  (if (< a b)
      a
      b))

(define (sum-of-two-biggest-squares a b c)
  (sum-of-squares (max-of-two a b) 
                  (max-of-two c (min-of-two a b))))

;; test
(sum-of-two-biggest-squares 1 2 3)