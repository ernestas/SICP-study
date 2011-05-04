;; square tree

(define (square-tree tree)
  (tree-map square tree))

;; helpers

(define (square x) (* x x))
(define nil '())

;; tree map

(define (tree-map proc items)
  (cond ((null? items) nil)
        ((not (pair? items)) (proc items))
        (else (cons (tree-map proc (car items))
                    (tree-map proc (cdr items))))))

;; test

(square-tree (list 1(list 2 (list 3 4) 5) (list 6 7)))