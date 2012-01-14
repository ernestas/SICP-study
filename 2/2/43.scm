;; Original

(flatmap (lambda (rest-of-queens)
           (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                (enumerate-interval 1 board-size)))
         (queen-cols (- k 1)))

;; Louis'

(flatmap (lambda (new-row)
           (map (lambda (rest-of-queens) (adjoin-position new-row k rest-of-queens))
                (queen-cols (- k 1))))
         (enumerate-interval 1 board-size))

;; (enumerate-interval 1 board-size)
;; is switched with
;; (queen-cols (- k 1))
;;
;; making many unnecessary and computationally
;; expensive calls to queen-cols
