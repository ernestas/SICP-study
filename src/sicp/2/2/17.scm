(define (last-pair-cust items)
  (if (null? (cdr items))
      items
      (last-pair-cust (cdr items))))

;; test

(last-pair-cust (list 23 72 149 34))
