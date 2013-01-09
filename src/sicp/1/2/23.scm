(define (prime? n)
  (= n (smallest-divisor n)))

(load "21.scm")

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

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

(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)

;---
; with improved next:

; (load "/Users/pinky&thebrain/Documents/sicp/1/23.scm")
; ;Loading "Documents/sicp/1/23.scm"...
; 1000000007 *** 3.0000000000000027e-2
; 1000000009 *** .03999999999999998
; 1000000021 *** 4.0000000000000036e-2
;
; 10000000019 *** .10999999999999999
; 10000000033 *** .1200000000000001
; 10000000061 *** .10999999999999999
;
; 100000000003 *** .35
; 100000000019 *** .34999999999999987
; 100000000057 *** .3599999999999999
;
; 1000000000039 *** 1.1
; 1000000000061 *** 1.1099999999999994
; 1000000000063 *** 1.1000000000000005
; ;... done
; ;Unspecified return value

;---
; old:

; (load "/Users/guesswho/Documents/sicp/1/22.scm")
; ;Loading "Documents/sicp/1/22.scm"...
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

;---
; approximate ratio of speeds:
; 1.729 / 1.100 = 1.571
; 0.560 / 0.359 = 1.559
; 0.169 / 0.109 = 1.550
; 0.049 / 0.040 = 1.225
;
; not as expected to be twice as fast
; might be because we exchanged primitive procedure +
; for user defined next, which has to run if every time
