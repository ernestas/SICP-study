;; square tree

(define (square-tree tree)
  (tree-map square tree))

(define (square-tree-map tree)
  (tree-map-map square tree))

;; helpers

(define (square x) (* x x))
(define nil '())

;; tree map

(define (tree-map proc items)
  (cond ((null? items) nil)
        ((not (pair? items)) (proc items))
        (else (cons (tree-map proc (car items))
                    (tree-map proc (cdr items))))))

;; tree map using map (bazinga)

(define (tree-map-map proc items)
  (map (lambda (sub-items)
         (if (pair? sub-items)
             (tree-map-map proc sub-items)
             (proc sub-items)))
       items))

;; test

(define tree-to-square (list 1(list 2 (list 3 4) 5) (list 6 7)))

(square-tree     tree-to-square)
(square-tree-map tree-to-square)
