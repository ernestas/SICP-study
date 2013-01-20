(define (text-of-quotation exp) (cadr exp))

(put 'quote
     (lambda (exp env)
       (text-of-quotation exp)))
