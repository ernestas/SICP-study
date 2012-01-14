;; accumulate / fold-right

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

;; fold-left

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


;; helpers

(define nil '())

;; reverse

(define (reverse-cust sequence)
  (fold-right (lambda (x y) (append y (list x)))
              nil
              sequence))

(define (reverse-cust2 sequence)
  (fold-left (lambda (x y) (cons y x))
             nil
             sequence))

;; tests

(reverse-cust '(1 4 9 16 25))
(reverse-cust2 '(1 4 9 16 25))
