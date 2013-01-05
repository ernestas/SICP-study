;; syntax procedures

(define bool-operands cdr)
(define first-bool car)
(define rest-bools cdr)

;; evaluation procedures

(define (eval-and exp env)
  (define (eval-and-operands operands)
    (cond ((null? operands) 'true)
          ((eval (first-bool operands) env)
           (eval-and-operands (rest-bools operands)))
          (else 'false)))
  (eval-and-operands (bool-operands exp)))

(define (eval-or exp env)
  (define (eval-or-operands operands)
    (cond ((null? operands) 'false)
          ((eval (first-bool operands) env) 'true)
          (else (eval-or-operands (rest-bools operands)))))
  (eval-or-operands (bool-operands exp)))

(put 'and eval-and)
(put 'or eval-or)

;; 'and' and 'or' as derived expressions

(define (and->if exp)
  (define (expand-clauses clauses)
    (if (null? clauses)
        'true
        (make-if (first-bool)
                 (expand-clauses (rest-bools clauses))
                 'false)))
  (expand-clauses (bool-operands exp)))

(define (or->if exp)
  (define (expand-clauses clauses)
    (if (null? clauses)
        'false
        (make-if (first-bool)
                 'true
                 (expand-clauses (rest-bools clauses)))))
  (expand-clauses (bool-operands exp)))

(put 'and
     (λ (exp env)
       (eval (and->if exp) env)))
(put 'or
     (λ (exp evn)
       (eval (or->if exp) evn)))
