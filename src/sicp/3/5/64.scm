(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(load "64_limit.scm")

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; tests

(sqrt 4 0.000000001)
