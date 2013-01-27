(load "13_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "13_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
