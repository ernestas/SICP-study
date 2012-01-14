;; accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; map

(define (map-cust proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map-cust proc (cdr items)))))

;; count-leaves

(define (count-leaves tree)
  (accumulate +
              0
              (map-cust (lambda (x) (if (not (pair? x))
                                        1
                                        (count-leaves x)))
                        tree)))

;; helpers

(define nil '())

;; test

(define x (cons (list 1 2) (list 3 4)))
(list x x)
(count-leaves (list x x))
