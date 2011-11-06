(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (square x) (* x x))

;---

(define (fermat-test a n)
    (= (expmod a n n) a))

(define (fool-fermat-iter? a n)
  (cond ((= a 0) true)
        ((fermat-test a n) (fool-fermat-iter? (- a 1) n))
        (else false)))

(define (fool-fermat? n)
  (cond ((fool-fermat-iter? (- n 1) n) (display n)
                                       (display " Fools")
                                       (newline))
        (else (display n)
              (display " Doesn't fool")
              (newline))))

(fool-fermat? 560)
(fool-fermat? 561)
(fool-fermat? 1105)
(fool-fermat? 1729)
(fool-fermat? 2465)
(fool-fermat? 2821)
(fool-fermat? 6601)
(fool-fermat? 6602)