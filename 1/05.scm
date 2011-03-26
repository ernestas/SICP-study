; applicative-order evaluation
; operator and operands are evaluated before applying the procedure
; (p) returns itself and thus gets in to a recursive, never ending, loop

; normal-order evaluation
; (p) is substituted for y,
; but is not evaluated until it is needed,
; whis is never, and test returns 0

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))