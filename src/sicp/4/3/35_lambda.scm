(define (lambda-parameters exp) (cadr exp))
(define (lambda-body exp) (cddr exp))

(put 'lambda
     (lambda (exp)
       (let ((vars (lambda-parameters exp))
             (bproc (analyze-sequence (lambda-body exp))))
         (lambda (env succeed fail)
           (succeed (make-procedure vars bproc env) fail)))))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))
