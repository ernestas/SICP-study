(define (definition? exp)
  (tagged-list? exp 'define))

(define (scan-out-defines body)
  (let ((def-exps '())
        (other-exps '()))
    (let scan-out-iter ((remaining-body body))
      (let ((first-exp (car remaining-body))
            (rest-exps (cdr remaining-body)))
        (cond ((null? remaining-body) '())
              ((definition? first-exp)
               (set! def-exps (append def-exps (list first-exp))))
              (else (set! other-exps (append other-exps
                                             (list first-exp)))))
        (if (not (null? rest-exps))
            (scan-out-iter rest-exps))))
    (if (null? def-exps)
        body
        (append def-exps other-exps))))

(define (make-procedure parameters body env)
  (list 'procedure parameters (scan-out-defines body) env))

(define (compound-procedure? p)
  (tagged-list? p 'procedure))

(define (procedure-parameters p) (cadr p))
(define (procedure-body p) (caddr p))
(define (procedure-environment p) (cadddr p))
