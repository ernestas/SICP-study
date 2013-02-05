(define (eval* exp env) ((analyze exp) env))

(define (analyze exp)
  (cond ((self-evaluating? exp)
         (analyze-self-evaluating exp))
        ((variable? exp) (analyze-variable exp))

        ((get (car exp))
         ((get (car exp)) exp))

        ((application? exp) (analyze-application exp))
        (else
         (error "Unknown expression type: ANALYZE" exp))))
