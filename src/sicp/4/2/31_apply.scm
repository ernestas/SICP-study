(define (apply* procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env))) ; changed
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (procedure-parameters procedure)
           (list-of-prepared-args arguments
                                  (procedure-param-list procedure)
                                  env) ; changed
           (procedure-environment procedure))))
        (else (error "Unknown procedure type: APPLY" procedure))))
