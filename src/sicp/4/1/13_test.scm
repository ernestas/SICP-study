(load "09_test.scm")

(define-test (make-unbound)
  (interpret '(define x 1))
  (assert-equal 1 (interpret 'x))
  (interpret '(unbind x))
; (interpret 'x) ; Unbound variable x
  (interpret '(define x 1))
  (assert-equal 1 (interpret 'x)))
