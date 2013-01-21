(load "03_evaluator.scm")
(load "04_and_or.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "04_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests) ;; test and & or


(load "04_evaluator.scm")

(define the-global-environment (setup-environment))
(run-registered-tests) ;; test derived and & or
