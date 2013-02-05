(define (analyze-assignment exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env)
      (set-variable-value! var (vproc env) env)
      'ok)))

(define (assignment-variable exp) (cadr exp))

(define (assignment-value exp) (caddr exp))

(put 'set! analyze-assignment)
