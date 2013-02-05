(define (lambda-parameters exp) (cadr exp))
(define (lambda-body exp) (cddr exp))

(put 'lambda
     (lambda (exp)
       (let ((vars (lambda-parameters exp))
             (bproc (analyze-sequence (lambda-body exp))))
         (lambda (env) (make-procedure vars bproc env)))))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))
