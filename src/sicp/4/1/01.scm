(load "00_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "00_test.scm")

;; left to right
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((first (eval* (first-operand exps) env)))
        (cons first
              (list-of-values (rest-operands exps) env)))))

(define the-global-environment (setup-environment))
(run-registered-tests)

;; right to left
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((rest (list-of-values (rest-operands exps) env)))
        (cons (eval* (first-operand exps) env)
              rest))))

(define the-global-environment (setup-environment))
(run-registered-tests)
