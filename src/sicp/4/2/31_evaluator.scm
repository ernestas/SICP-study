;; Eval
(load "31_eval.scm")

(load "../1/00_self_evaluating.scm")
(define (variable? exp) (symbol? exp))
(load "../1/00_quoted.scm")
(load "../1/00_assignment.scm")
(load "../1/00_definition.scm")
(load "31_if.scm")
(load "../1/00_boolean.scm")
(load "../1/00_lambda.scm")
(load "../1/00_begin.scm")
(load "../1/00_cond.scm")
(load "31_application.scm") ; part of this
(load "31_thunks.scm") ; and all of this should really be under the apply VV

(define (interpret exp)
  (eval* exp the-global-environment))

;; Apply
(load "31_apply.scm")

(load "../1/00_primitive_procedure.scm")
(load "31_compound_procedure.scm")

;; Common stuff
(load "../1/00_eval_sequence.scm")

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(load "../1/00_environment.scm")

'METACIRCULAR-EVALUATOR-LOADED
