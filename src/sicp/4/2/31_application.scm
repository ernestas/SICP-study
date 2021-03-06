(define (application? exp) (pair? exp))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (actual-value exp env)
  (force-it (eval* exp env)))

(define (list-of-arg-values exps env)
  (if (no-operands? exps)
      '()
      (cons (actual-value (first-operand exps)
                          env)
            (list-of-arg-values (rest-operands exps)
                                env))))

(define (list-of-prepared-args exps param-list env)
  (if (no-operands? exps)
      '()
      (cons (prepare-argument (first-operand exps)
                              (first-operand param-list)
                              env)
            (list-of-prepared-args (rest-operands exps)
                                   (rest-operands param-list)
                                  env))))

(define (no-operands? ops) (null? ops))
(define (first-operand ops) (car ops))
(define (rest-operands ops) (cdr ops))
