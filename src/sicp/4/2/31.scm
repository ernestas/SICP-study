(load "31_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "31_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
