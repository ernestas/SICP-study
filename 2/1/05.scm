;; FUN

(define (cons-cust a b)
  (* (expt 2 a) (expt 3 b)))

(define (car-cust z)
  (count-even-divs 2 z 0))

(define (cdr-cust z)
  (count-even-divs 3 z 0))

; count the number of times z is evenly divisible by n
(define (count-even-divs n z result)
  (if (zero? (remainder z n))
      (count-even-divs n (/ z n) (+ result 1))
      result))

;; tests

(car-cust (cons-cust 2 5))
(cdr-cust (cons-cust 2 5))