(define (iterative-improve good-enough? improve)
  (lambda (initial-guess)
    (define (iter guess)
      (let ((improved-guess (improve guess)))
        (if (good-enough? guess improved-guess)
            improved-guess
            (iter improved-guess))))
      (iter initial-guess)))

;---

(define (square-root x)
  ((iterative-improve (lambda (a b)
                        (let ((ratio (/ a b)))
                          (and (< ratio 1.001) (> ratio 0.999))))
                      (lambda (y)
                        (/ (+ (/ x y) y) 2)))
   1.0))

(square-root 9)

;---

(define (fixed-point f x) 
  ((iterative-improve (lambda (a b)
                        (< (abs (- a b)) 0.00001))
                      (lambda (y)
                        (f y)))
   1.0))

(fixed-point cos 1.0)