(load "../../1/2/28_prime.scm")

;; accumulate / fold-right

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; enumerate (not built in DrRacket)

(define (enumerate-interval a b) ; normal scheme version
  (if (> a b)
      '()
      (cons a (enumerate-interval (+ a 1) b))))

;; helpers

(define nil '())

;; given:

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

;; unique pairs i, j
;; 1 <= j < i <= n

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

;; tests

(unique-pairs 4)
(prime-sum-pairs 4)
