;; mit-scheme

;; expand
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

;; tests

(expand 1 7 10)
;; (1 4 2 8 5 7)
;; 0.(142857)
(expand 3 8 10)
;; 3 7 5 (0)
;; 0.375
