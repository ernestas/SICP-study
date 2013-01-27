(put 'while
     (lambda (exp env)
       (eval* (while->combination exp) env)))

(define (while-predicate exp) (cadr exp))
(define (while-body exp) (caddr exp))

(define (while->combination exp)
  (sequence->exp (list (list 'define
                             (list 'while-iter)
                             (sequence->exp (list (while-body exp)
                                                  (make-if (while-predicate exp)
                                                           (list 'while-iter)
                                                           'true))))
                       (list 'while-iter))))
