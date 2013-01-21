(load "00_test.scm")

(define-test (test-and)
  (assert-false (interpret '(and false false 3)))
  (assert-equal 3 (interpret '(and 1 2 3)))
  (assert-true (interpret '(and))))

(define-test (test-or)
  (assert-equal 1 (interpret '(or 1 2 3)))
  (assert-equal 3 (interpret '(or false false 3)))
  (assert-false (interpret '(or false false)))
  (assert-false (interpret '(or))))
