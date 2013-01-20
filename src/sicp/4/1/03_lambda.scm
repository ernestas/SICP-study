(define (lambda-parameters exp) (cadr exp))
(define (lambda-body exp) (cddr exp))

(put 'lambda
     (lambda (exp env)
       (make-procedure (lambda-parameters exp)
                       (lambda-body exp)
                       env)))

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))
