(load "08_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "08_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
