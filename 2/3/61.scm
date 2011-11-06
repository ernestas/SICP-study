;; adjoin-set

(define (adjoin-set x set)
  (cond ((or (null? set)
             (< x (car set))) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

;; tests

(adjoin-set 1 '(2 3 4))
(adjoin-set 3 '(2 4 5))