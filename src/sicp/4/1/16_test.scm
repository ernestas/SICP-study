(load "13_test.scm")

(define-test (scan-out-defines)
  (interpret '(define (add-one x)
                a
                (define a (+ x 1))))
  (assert-equal 2 (interpret '(add-one 1))))
