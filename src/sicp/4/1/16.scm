(load "16_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "16_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)

;; It is better to install scan-out-defines in make-procedure, since it will
;; only be run once during the definition, whereas procedure-body will run it on
;; every procedure call.
