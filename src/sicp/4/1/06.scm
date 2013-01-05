;; syntax procedures

(define (let-variables exp)
  (map car (cadr exp)))
(define (let-body exp)
  (cddr exp))
(define (let-expressions exp)
  (map cadr (cadr exp)))

;; let->combination

(define (let->combination exp)
  (cons (make-lambda (let-variables exp)
                     (let-body exp))
        (let-expressions exp)))

(put 'let
     (λ (exp env)
       (eval (let->combination exp) env)))
