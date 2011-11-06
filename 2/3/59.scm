;; element-of-set?

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; union-set

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (cons (car set1)
                    (union-set (cdr set1) set2)))))

;; tests

(element-of-set? 3 '(1 2 3))
(element-of-set? 5 '(1 2 3))

(union-set '(1 2 3) '(3 4 5))