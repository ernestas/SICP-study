(define (multiply a b)
  (define (mult-iter a b n)
    (cond ((= b 0) n)
          ((even? b) (mult-iter (double a) (halve b) n))
          (else (mult-iter a (- b 1) (+ n a)))))
  (mult-iter a b 0))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))
