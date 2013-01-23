(load "07_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "07_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
