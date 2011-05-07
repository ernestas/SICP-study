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

;; tests

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))

(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

(fold-right + 0 (list 1 2 3 4))
(fold-left + 0 (list 1 2 3 4))

;; op has to be associative to guarantee thhat
;; fold-right and fold-left produce the same values
;; for any sequence