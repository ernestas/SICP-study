(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;---
; modified to print out only primes
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
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

; (load "/Users/boomboom/Documents/sicp/1/24.scm")
; ;  Loading "Documents/sicp/1/24.scm"...  
; 1000000007 *** 0.
; 1000000009 *** 1.0000000000000009e-2
; 1000000021 *** 1.0000000000000009e-2
; 
; 10000000019 *** 1.0000000000000009e-2
; 10000000033 *** 1.0000000000000009e-2
; 10000000061 *** 1.0000000000000009e-2
; 
; 100000000003 *** 1.0000000000000009e-2
; 100000000019 *** 1.0000000000000009e-2
; 100000000057 *** 1.0000000000000009e-2
; 
; 1000000000039 *** 1.0000000000000009e-2
; 1000000000061 *** 1.0000000000000009e-2
; 1000000000063 *** 1.9999999999999907e-2
; ;  ... done
; ;Unspecified return value

;---
; numbers too small or machine too fast to show logarithmic growth