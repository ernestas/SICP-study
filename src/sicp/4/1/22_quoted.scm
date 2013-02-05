(define (text-of-quotation exp) (cadr exp))

(put 'quote
     (lambda (exp)
       (let ((qval (text-of-quotation exp)))
         (lambda (env) qval))))
