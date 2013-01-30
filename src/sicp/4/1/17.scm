(load "17_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "16_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)

;; There is an extra frame in the transformed procedure because the let is
;; transformed into a lambda, which wraps everything inside that the outer
;; lambda did and thus does not make a difference in the behaviour of a correct
;; program.
