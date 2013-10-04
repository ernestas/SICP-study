;; put & get procedures
(load "../1/03_put_get.scm")

;; Eval
(load "35_eval.scm")

(load "35_self_evaluating.scm")
(load "35_variable.scm")
(load "35_quoted.scm")
(load "35_assignment.scm")
(load "35_definition.scm")
(load "35_if.scm")
(load "../1/00_boolean.scm")
(load "35_lambda.scm")
(load "35_begin.scm")
(load "../1/22_cond.scm")
(load "35_application.scm")
(load "../1/22_and_or_derived.scm")
(load "../1/22_let.scm")
(load "35_amb.scm")

(define (interpret exp)
  (ambeval exp
           the-global-environment
           (lambda (val next-alternative)
             val)
           (lambda ()
             (display "FAIL"))))

;; Apply
(load "../1/00_apply.scm")

(load "../1/00_primitive_procedure.scm")
(load "../1/00_compound_procedure.scm")

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(load "../1/16_environment.scm")

'METACIRCULAR-EVALUATOR-LOADED
