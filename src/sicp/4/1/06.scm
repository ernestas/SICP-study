(load "06_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "06_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
