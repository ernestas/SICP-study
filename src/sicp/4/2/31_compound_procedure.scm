(define (make-procedure parameters body env)
  (list 'procedure parameters body env))

(define (compound-procedure? p)
  (tagged-list? p 'procedure))

(define (procedure-parameters p)
  (map lazy-var (cadr p)))
(define (lazy-var param)
  (if (symbol? param)
      param
      (car param)))

(define (procedure-param-list p)
  (cadr p))

(define (procedure-body p) (caddr p))
(define (procedure-environment p) (cadddr p))
