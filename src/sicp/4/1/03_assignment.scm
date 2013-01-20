(define (eval-assignment exp env)
  (set-variable-value! (assignment-variable exp)
                       (eval* (assignment-value exp) env)
                       env)
  'ok)

(define (assignment-variable exp) (cadr exp))

(define (assignment-value exp) (caddr exp))

(put 'set! eval-assignment)
