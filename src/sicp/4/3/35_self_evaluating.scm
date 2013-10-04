(define (self-evaluating? exp)
  (cond ((number? exp) true)
        ((string? exp) true)
        (else false)))

(define (analyze-self-evaluating exp)
  (lambda (env succeed fail)
    (succeed exp fail)))
