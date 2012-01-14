(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;;---

(define (inc x) (+ x 1))

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)

;;---

(define (john-wallis-pi n)
  (define (term k)
    (if (even? k)
        (/ (+ k 2) (+ k 1))
        (/ (+ k 1) (+ k 2))))
  (* 4 (product term 1 inc n)))

(john-wallis-pi 5)
(john-wallis-pi 10)

;;---

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product-iter identity 1 inc n))

(factorial 5)
