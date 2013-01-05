(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

;---
; modified to print out only primes
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

;---

(define (search-for-primes start end)
  (if (<= start end)
      (cond ((even? start) (search-for-primes (+ start 1) end))
            (else (timed-prime-test start)
                  (search-for-primes (+ start 2) end)))
      (newline)))

;---

; these are too small to produce any meaningful results
(search-for-primes 1000 1019)
(search-for-primes 10000 10037)
(search-for-primes 100000 100043)
(search-for-primes 1000000 1000037)

(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)

;---

; (load "/Users/guesswho/Documents/sicp/1/22.scm")
; ;Loading "Documents/sicp/1/22.scm"...
; 1009 *** 0.
; 1013 *** 0.
; 1019 *** 0.
;
; 10007 *** 0.
; 10009 *** 0.
; 10037 *** 0.
;
; 100003 *** 0.
; 100019 *** 0.
; 100043 *** 0.
;
; 1000003 *** 0.
; 1000033 *** 0.
; 1000037 *** 1.0000000000000009e-2
;
; 1000000007 *** .04999999999999999
; 1000000009 *** .06000000000000005
; 1000000021 *** .04999999999999993
;
; 10000000019 *** .18000000000000005
; 10000000033 *** .18000000000000005
; 10000000061 *** .16999999999999993
;
; 100000000003 *** .55
; 100000000019 *** .55
; 100000000057 *** .56
;
; 1000000000039 *** 1.7400000000000002
; 1000000000061 *** 1.75
; 1000000000063 *** 1.7299999999999995
; ;... done
; ;Unspecified return value

; When increasing the tested numbers by factor of 10
; we can see the increase in time by factor of approx. 3
; thus confirming the O(sqrt(n))
; sqrt(10) ≅ 3
