(load "16_test.scm")

(define-test (letrec)
  (assert-equal 3628800
                (interpret '(letrec ((fact (lambda (n)
                                             (if (= n 1)
                                                 1
                                                 (* n (fact (- n 1)))))))
                              (fact 10)))))
