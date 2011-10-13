;; fringe v1

(define (fringe items)
  (if (null? items)
      nil
      (let ((first (car items)))
        (append (if (pair? first)
                    (fringe first)
                    (list first))
                (fringe (cdr items))))))

;; fringe v2

(define (fringe2 items)
  (cond ((null? items) nil)
        ((not(pair? items)) (list items))
        (else (append (fringe (car items))
                      (fringe (cdr items))))))

;; nil

(define nil '())

;; tests

(define x (list (list 1 2) (list 3 4)))

(fringe x)
(fringe (list x x))

(newline)

(fringe2 x)
(fringe2 (list x x))