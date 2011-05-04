;; reverse

(define (reverse-cust items)
  (define (reverse-iter items items-rev)
    (if (null? items)
        items-rev
        (reverse-iter (cdr items) 
                      (cons (car items) items-rev))))
  (reverse-iter items ()))

;; deep-reverse

(define (deep-reverse items)
  (define (reverse-iter items items-rev)
    (if (null? items)
        items-rev
        (let ((first (car items)))
          (reverse-iter (cdr items) 
                        (cons (if (pair? first)
                                  (deep-reverse first)
                                  first)
                              items-rev)))))
  (reverse-iter items ()))

;; tests

(define x (list (list 1 2) (list 3 4)))

(reverse-cust x)
(deep-reverse x)