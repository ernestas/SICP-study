;; for-each

(define (for-each-cust proc items)
  (cond ((not (null? items))
         (proc (car items))
         (for-each-cust proc (cdr items)))))

;; nil

(define nil '())

;; tests

(for-each-cust (lambda (x) (newline) (display x))
          (list 57 321 88))
