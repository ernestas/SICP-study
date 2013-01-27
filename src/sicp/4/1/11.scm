(load "11_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "09_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
