(load "07_test.scm")

(define-test (test-named-let)
  (interpret '(define (fib n)
                (let fib-iter ((a 1)
                               (b 0)
                               (count n))
                  (if (= count 0)
                      b
                      (fib-iter (+ a b) a (- count 1))))))
  (assert-equal 55 (interpret '(fib 10)))
  (assert-equal 89 (interpret '(fib 11))))
