(define (make-monitored f)
  (define counter 0)
  (lambda (input)
    (cond ((eq? input 'how-many-calls?) counter)
	  ((eq? input 'reset-count) (set! counter 0))
	  (else (begin (set! counter (+ 1 counter))
		       (f input))))))

;; tests

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)

(newline)

(s 'reset-count)
(s 'how-many-calls?)
