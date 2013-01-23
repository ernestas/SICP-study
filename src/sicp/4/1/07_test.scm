(load "06_test.scm")

(define-test (test-let*)
  (assert-equal 39
                (interpret '(let* ((x 3)
                                   (y (+ x 2))
                                   (z (+ x y 5)))
                              (* x z)))))
