(define (square x) (* x x))

(define (tan-cf x k)
  (define (rec i)
    (/ (if (= i 1)
           x
           (square x))
       (- (- (* i 2) 1)
          (if (= i k)
              0
              (rec (+ i 1))))))
  (rec 1.0))

; using cont-frac
(define (cont-frac n d k)
  (define (rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (rec (+ i 1))))))
  (rec 1))

(define (tan-cf-cont-frac x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (square x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(tan-cf 1 9)
(tan-cf-cont-frac 1.0 9)
