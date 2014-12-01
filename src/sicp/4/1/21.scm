;; FUN

(load "20_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "20_test.scm")

(define-test (Y)
  (assert-equal 3628800
                (interpret '((lambda (n)
                               ((lambda (fact) (fact fact n))
                                (lambda (ft k)
                                  (if (= k 1)
                                      1
                                      (* k (ft ft (- k 1)))))))
                             10)))
  (assert-equal 55
                (interpret '((lambda (n)
                               ((lambda (fib) (fib fib n))
                                (lambda (f k)
                                  (cond ((= k 0) 0)
                                        ((= k 1) 1)
                                        (else (+ (f f (- k 1))
                                                 (f f (- k 2))))))))
                             10)))
  (interpret '(define (f x)
                ((lambda (even? odd?) (even? even? odd? x))
                 (lambda (ev? od? n)
                   (if (= n 0) true (od? ev? od? (- n 1))))
                 (lambda (ev? od? n)
                   (if (= n 0) false (ev? ev? od? (- n 1)))))))
  (assert-true (interpret '(f 2)))
  (assert-false (interpret '(f 3))))

(define the-global-environment (setup-environment))
(run-registered-tests)
