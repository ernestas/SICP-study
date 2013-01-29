;; put & get procedures
(load "03_put_get.scm")

;; Eval
(load "03_eval.scm")

(load "00_self_evaluating.scm")
(define (variable? exp) (symbol? exp))
(load "03_quoted.scm")
(load "03_assignment.scm")
(load "03_definition.scm")
(load "03_if.scm")
(load "00_boolean.scm")
(load "03_lambda.scm")
(load "03_begin.scm")
(load "05_cond.scm")
(load "00_application.scm")
(load "04_and_or_derived.scm")
(load "08_let.scm")
(load "07_let*.scm")
(load "09_while.scm")
(load "13_make_unbound.scm")

(define (interpret exp)
  (eval* exp the-global-environment))

;; Apply
(load "00_apply.scm")

(load "00_primitive_procedure.scm")
(load "16_compound_procedure.scm")

;; Common stuff
(load "00_eval_sequence.scm")

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(load "16_environment.scm")

'METACIRCULAR-EVALUATOR-LOADED
