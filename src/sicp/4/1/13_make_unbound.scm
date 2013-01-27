(define (eval-unbind exp env)
  (make-unbound! (unbind-var exp) env))

(define unbind-var cadr)

(put 'unbind eval-unbind)
