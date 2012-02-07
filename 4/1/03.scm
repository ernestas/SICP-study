;; put & get procedures
(include "73_put_get.scm")

;; eval
(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))

        ((get (car exp))
         ((get (car exp)) exp env))

        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))

(put 'quote
     (λ (exp env)
       (text-of-quotation exp)))

(put 'set! eval-assignment)
(put 'define eval-definition)
(put 'if eval-if)

(put 'lambda
     (λ (exp env)
       (make-procedure (lambda-parameters exp)
                       (lambda-body exp)
                       env)))

(put 'begin
     (λ (exp env)
       (eval-sequence (begin-actions exp) env)))

(put 'cond
     (λ (exp env)
       (eval (cond->if exp) env)))
