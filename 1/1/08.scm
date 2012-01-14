(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? (/ guess (improve guess x)))
          guess
          (cube-root-iter (improve guess x)
                     x)))

(define (good-enough? ratio)
  (and (< ratio 1.001) (> ratio 0.999)))

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))
