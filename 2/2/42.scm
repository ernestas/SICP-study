;; FUN?

;; enumerate (not built in DrRacket)

(define (enumerate-interval a b) ; normal scheme version
  (if (> a b)
      '()
      (cons a (enumerate-interval (+ a 1) b))))

;; accumulate / fold-right

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; helpers

(define nil '())

;; flat map

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; queens

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0) (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

;; empty board

(define empty-board '())

;; adjoin position

(define (adjoin-position row col board)
  (append (list row) board))

;; safe?

(define (safe? col board)
  (define (safe-iter position distance cols)
    (cond ((null? cols) #t)
          ((= (car cols) position) #f)
          ((= (- (car cols) distance) position) #f)
          ((= (+ (car cols) distance) position) #f)
          (else (safe-iter position (+ distance 1) (cdr cols)))))
  (safe-iter (car board) 1 (cdr board)))

;; tests

(queens 4)
(queens 5)
(queens 8)
