(define (cont-frac-iter n d k)
  (define (iter i total)
    (cond ((= i 0) total)
          (else (iter (- i 1) (/ (n i) (+ (d i) total))))))
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) (if (= (modulo (+ i 1) 3) 0)
                                (/ (+ i 1) 1.5)
                                1.0))
                10)
