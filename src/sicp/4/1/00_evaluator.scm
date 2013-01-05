;; Eval
(load "00_eval.scm")

(load "00_self_evaluating.scm")
(define (variable? exp) (symbol? exp))
(load "00_quoted.scm")
(load "00_assignment.scm")
(load "00_definition.scm")
(load "00_if.scm")
(load "00_boolean.scm")
(load "00_lambda.scm")
(load "00_begin.scm")
(load "00_cond.scm")
(load "00_application.scm")

(define (interpret exp)
  (eval* exp the-global-environment))

;; Apply
(load "00_apply.scm")

(load "00_primitive_procedure.scm")
(load "00_compound_procedure.scm")

;; Common stuff
(load "00_eval_sequence.scm")

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(load "00_environment.scm")

'METACIRCULAR-EVALUATOR-LOADED
