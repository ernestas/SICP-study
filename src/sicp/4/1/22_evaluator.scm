;; put & get procedures
(load "03_put_get.scm")

;; Eval
(load "22_eval.scm")

(load "22_self_evaluating.scm")
(define (variable? exp) (symbol? exp))
(define (analyze-variable exp)
  (lambda (env) (lookup-variable-value exp env)))
(load "22_quoted.scm")
(load "22_assignment.scm")
(load "22_definition.scm")
(load "22_if.scm")
(load "00_boolean.scm")
(load "22_lambda.scm")
(load "22_begin.scm")
(load "22_cond.scm")
(load "22_application.scm")
(load "22_and_or_derived.scm")
(load "22_let.scm")
;; (load "07_let*.scm")
;; (load "09_while.scm")
;; (load "13_make_unbound.scm")
;; (load "20_letrec.scm")

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

(load "16_environment.scm")

'METACIRCULAR-EVALUATOR-LOADED
