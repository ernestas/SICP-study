(define (sqrt-1.7 x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? (/ guess (improve guess x)))
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (good-enough? ratio)
  (and (< ratio 1.001) (> ratio 0.999)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))