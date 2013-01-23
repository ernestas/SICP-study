(load "05_test.scm")

(define-test (test-let)
  (assert-equal 6
                (interpret '(let ((a 1) (b 2) (c 3))
                              (+ a b c)))))
