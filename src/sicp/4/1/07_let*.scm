;; syntax procedures

(define (let*-bindings exp)
  (cadr exp))
(define (let*-body exp)
  (caddr exp))
(define (make-let bindings body)
  (list 'let bindings body))

;; let*->nested-lets

(define (let*->nested-lets exp)
  (define (let*->nested-lets-iter bindings body)
    (if (null? bindings)
        body
        (make-let (list (car bindings))
                  (let*->nested-lets-iter (cdr bindings)
                                          body))))
  (let*->nested-lets-iter (let*-bindings exp)
                          (let*-body exp)))

;; It is sufficient to add a clause to eval or in the case of dispatch in
;; data-directed style:

(put 'let*
     (lambda (exp env)
       (eval* (let*->nested-lets exp) env)))
