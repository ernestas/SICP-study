;; memq

(define (memq-cust item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

;; tests

(list 'a 'b 'c)
(list (list 'george))

(newline)

(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))

(newline)

(pair? (car '(a short list)))

(newline)

(memq-cust 'red '((red shoes) (blue socks)))
(memq-cust 'red '(red shoes blue socks))