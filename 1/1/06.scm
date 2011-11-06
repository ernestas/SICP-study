(define (sqrt-1.6 x)
  (sqrt-iter 1.0 x))

; runs out of memory,
; because new-if is not a special form,
; which regular if is.
; in new-if operands are evaluated before applying the procedure
; and even if the guess is good enough
; the second part of new-if statement is evaluated aswell
; in turn calling new-if again,
; which will cause an infinite loop
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))