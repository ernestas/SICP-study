(define (cont-frac n d k)
  (define (rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (rec (+ i 1))))))
  (rec 1))

(define (cont-frac-iter n d k)
  (define (iter i total)
    (cond ((= i 0) total)
          (else (iter (- i 1) (/ (n i) (+ (d i) total))))))
  (iter k 0))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)
