(define (average a b) (/ (+ a b) 2))

;---

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

;---

(define (compose-cust f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (compose-cust f (repeated f (- n 1)))))

;---

(define (square-root x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y))))
               1.0))
(define (fourth-root x)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (expt y 3))))
                         2)
               1.0))

;---

(define (log2 x)
  (floor (/ (log x) (log 2))))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (log2 n))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

;---

(square-root 9)
(nth-root 9 2)

(cube-root 27)
(nth-root 27 3)

(fourth-root 81)
(nth-root 81 4)

(nth-root 32 5)
(nth-root 243 5)

(nth-root 64 6)
