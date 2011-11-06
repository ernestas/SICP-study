;; map

(define (map-cust proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map-cust proc (cdr items)))))

;; square

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(define (square-list-map items)
  (map-cust (lambda (x) (* x x))
            items))

;; nil

(define nil '())

;; tests

(square-list (list 1 2 3))
(square-list-map (list 1 2 3))