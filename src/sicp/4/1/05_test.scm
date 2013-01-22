(load "04_test.scm")

(define-test (test-cond-extended-syntax)
  (interpret '(define (caar x)
		(car (car x))))
  (interpret '(define (assoc key records)
		(cond ((null? records) false)
		      ((equal? key (caar records)) (car records))
		      (else (assoc key (cdr records))))))
  (interpret '(define (cadr x)
		(car (cdr x))))
  (assert-equal 2
		(interpret
		 '(cond ((assoc 'b '((a 1) (b 2))) => cadr)
			(else false)))))
