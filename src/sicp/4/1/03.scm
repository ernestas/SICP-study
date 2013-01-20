(load "03_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "00_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)
