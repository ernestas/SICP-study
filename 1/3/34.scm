(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)
(f (lambda (z) (* z (+ z 1))))

; (f f)
; (f 2)
; (2 2)
; error, since 2 is not a procedure
(f f)
