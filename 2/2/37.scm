;; accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; accumulate-n

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op
                        init
                        (map (lambda (x) (car x)) seqs))
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x)) seqs)))))

;; helpers

(define nil '())

;; matrix operations

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row))
         m)))

;; tests

(define v '(1 2 3 4))
(define w '(6 7 8 9))
(dot-product v w)

(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(matrix-*-vector m v)

(transpose m)

(matrix-*-matrix '((1 4 6)) '((2 3) (5 8) (7 9)))
