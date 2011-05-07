;; accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; map

(define (map-cust proc sequence)
  (accumulate (lambda (x y) (cons (proc x) y))
              nil
              sequence))

;; append

(define (append-cust seq1 seq2)
  (accumulate cons
              seq2
              seq1))

;; length

(define (length-cust sequence)
  (accumulate (lambda (x y) (+ 1 y))
              0
              sequence))

;; helpers

(define (square x) (* x x))
(define nil '())

;; tests

(map-cust square nil)
(map-cust square '(1 2 3))

(newline)

(append-cust '(1 2 3) '(4 5 6))
(append-cust '(4 5 6) '(1 2 3))

(newline)

(length-cust '(1))
(length-cust '(1 2))
(length-cust '(1 2 3))