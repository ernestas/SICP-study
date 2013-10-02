(load "../1/00_test.scm")

(define-test (test-lazy)
  (interpret '(define (try a (b lazy))
                (if (= a 0)
                    1
                    b)))
  (assert-equal 1 (interpret '(try 0 (/ 1 0)))))
