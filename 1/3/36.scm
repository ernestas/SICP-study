(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; 35 guesses
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             2)

(define (average a b)
  (/ (+ a b) 2))

; 10 guesses with damping (averaging)
(fixed-point (lambda (x) (average (/ (log 1000) (log x)) x))
             2)