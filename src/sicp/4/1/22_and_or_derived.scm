;; syntax procedures

(define and-or-clauses cdr)
(define first-clause car)
(define rest-clauses cdr)

;; 'and' and 'or' as derived expressions

(define (and->if exp)
  (define (expand-clauses clauses result)
    (if (null? clauses)
	result
	(let ((first-eval (first-clause clauses)))
	  (make-if first-eval
		   (expand-clauses (rest-clauses clauses) first-eval)
		   'false))))
  (expand-clauses (and-or-clauses exp) 'true))

(define (or->if exp)
  (define (expand-clauses clauses)
    (if (null? clauses)
        'false
	(let ((first-eval (first-clause clauses)))
	  (make-if first-eval
		   first-eval
		   (expand-clauses (rest-clauses clauses))))))
  (expand-clauses (and-or-clauses exp)))

(put 'and
     (lambda (exp)
       (analyze (and->if exp))))

(put 'or
     (lambda (exp)
       (analyze (or->if exp))))
