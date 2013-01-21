;; syntax procedures

(define and-or-clauses cdr)
(define first-clause car)
(define rest-clauses cdr)

;; evaluation procedures

(define (eval-and exp env)
  (define (eval-and-iter clauses result)
    (if (null? clauses)
	result
	(let ((first-eval (eval* (first-clause clauses) env)))
	  (if (true? first-eval)
	      (eval-and-iter (rest-clauses clauses) first-eval)
	      false))))
  (eval-and-iter (and-or-clauses exp) true))

(define (eval-or exp env)
  (define (eval-or-iter clauses)
    (if (null? clauses)
	false
	(let ((first-eval (eval* (first-clause clauses) env)))
	  (if (true? first-eval)
	      first-eval
	      (eval-or-iter (rest-clauses clauses))))))
  (eval-or-iter (and-or-clauses exp)))

(put 'and eval-and)
(put 'or eval-or)
