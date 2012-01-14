;; square 1
;; the answer is in reverse because
;; the numbers are taken from one queue
;; and are stacked onto the other, thus
;; making them in reverse

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; square 2
;; the order of cons is changed but,
;; cons conses the value onto the list
;; and in this case answer is a list
;; so it conses list onto a list

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; helpers

(define nil '())
(define (square x) (* x x))

;; tests

(square-list (list 1 2 3 4))
(square-list-2 (list 1 2 3 4))
