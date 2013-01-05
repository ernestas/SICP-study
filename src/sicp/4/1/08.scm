;; syntax procedures

(define (named-let-name exp)
  (cadr exp))
(define (named-let-variables exp)
  (let-variables (cdr exp)))
(define (named-let-expressions exp)
  (let-expressions (cdr exp)))
(define (named-let-body exp)
  (let-body (cdr exp)))
(define (named-let? exp)
  (variable? (named-let-name exp)))

;; let->combination with support for named let

(define (let->combination exp)
  (if (named-let? exp)
      (sequence-exp (list (list 'define
                                (cons (named-let-name exp)
                                      (named-let-variables exp))
                                (named-let-body exp))
                          (cons (named-let-name exp)
                                (named-let-expressions exp))))
      (cons (make-lambda (let-variables exp)
                         (let-body exp))
            (let-expressions exp))))
