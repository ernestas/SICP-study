(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (inc x) (+ x 1))

;;---

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;;---

(define (factorial n)
  (define (mult a b) (* a b))
  (accumulate mult 1 identity 1 inc n))

(define (factorial-iter n)
  (define (mult a b) (* a b))
  (accumulate-iter mult 1 identity 1 inc n))

(factorial 5)
(factorial-iter 5)

;;---

(define (sum-integers a b)
  (define (add a b) (+ a b))
  (accumulate add 0 identity a inc b))


(define (sum-integers-iter a b)
  (define (add a b) (+ a b))
  (accumulate-iter add 0 identity a inc b))

(sum-integers 1 10)
(sum-integers-iter 1 10)
