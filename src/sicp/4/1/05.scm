(load "05_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "05_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
