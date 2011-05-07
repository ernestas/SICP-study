;; accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; horner's rule evaluation

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

;; test
;; 1 + 3x + 5x^3 + x^5
;; at x = 2
(horner-eval 2 (list 1 3 0 5 0 1))