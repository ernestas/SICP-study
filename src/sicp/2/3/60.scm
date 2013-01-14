;; element-of-set?

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; adjoin-set
;; before: O(n)
;;  after: O(1)

(define (adjoin-set x set)
  (cons x set))

;; intersection-set

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; union-set
;; before: O(n^2)
;;  after: O(n)

(define (union-set set1 set2)
  (append set1 set2))

;; tests

(element-of-set? 3 '(3 2 1 1 2 3))
(element-of-set? 5 '(3 2 1 1 2 3))

(adjoin-set 1 '(2 3 4))
(intersection-set '(3 2 1 1 2 3) '(5 4 3 3 4 5))

(union-set '(3 2 1 1 2 3) '(5 4 3 3 4 5))
