;; map

(define (map-cust proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map-cust proc (cdr items)))))

;; nil

(define nil '())

;; square tree

(define (square-tree items)
  (cond ((null? items) nil)
        ((not (pair? items)) (* items items))
        (else (cons (square-tree (car items))
                    (square-tree (cdr items))))))

(define (square-tree-map items)
  (map (lambda (sub-items)
         (if (pair? sub-items)
             (square-tree-map sub-items)
             (* sub-items sub-items)))
       items))

;; tests

(square-tree (list 1(list 2 (list 3 4) 5) (list 6 7)))
(square-tree-map (list 1(list 2 (list 3 4) 5) (list 6 7)))