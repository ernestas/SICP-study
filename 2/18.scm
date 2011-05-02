(define (reverse-cust items)
  (define (reverse-iter items items-rev)
    (if (null? items)
        items-rev
        (reverse-iter (cdr items) 
                      (cons (car items) items-rev))))
  (reverse-iter items ()))

;; test

(reverse-cust (list 1 4 9 16 25))