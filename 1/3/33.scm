(include "../2/28_prime.scm")


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
