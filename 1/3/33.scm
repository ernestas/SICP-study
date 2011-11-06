(define (square x) (* x x))

(define (miller-rabin-expmod base exp m)
  (define (check candidate)
    (define (check-nontrivial candidate square)
      (if (and (not (= candidate 1))
               (not (= candidate (- m 1)))
               (= square 1))
          0
          square))
    (check-nontrivial candidate (remainder (square candidate) m)))
  (cond ((= exp 0) 1)
        ((even? exp) (check (miller-rabin-expmod base (/ exp 2) m)))
        (else (remainder (* base (miller-rabin-expmod base (- exp 1) m))
                         m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (define (check-it x)
      (and (not (= x 0)) (= x 1)))
    (check-it (miller-rabin-expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 100))

;;---
         
(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (combiner null-value
                        (filtered-accumulate combiner null-value term (next a) next b filter)))))

;;---

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (sum-primes-squared a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-primes-squared 2 5)

;;---

(define (product-of-rel-primes n)
  (define (rel-prime? x)
    (define (gcd a b)
      (if (= b 0)
          a
          (gcd b (remainder a b))))
    (= (gcd x n) 1))
  (filtered-accumulate * 1 identity 1 inc n rel-prime?))

(product-of-rel-primes 5)