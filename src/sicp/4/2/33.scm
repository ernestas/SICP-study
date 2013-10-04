(define (text-of-quotation exp)
  (let ((quoted (cadr exp)))
    (if (pair? quoted)
        (eval* (make-list quoted) env)
        quoted)))

(define (make-list elements)
  (if (null? elements)
      '()
      (list 'cons
            (car elements)
            (make-list (cdr elements)))))
