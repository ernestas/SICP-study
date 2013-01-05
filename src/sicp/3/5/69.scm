;; mit-scheme

(load "54_integers.scm")

(load "66_pairs.scm")

(define (triples s t u)
  (cons-stream (list (stream-car s)
                     (stream-car t)
                     (stream-car u))
               (interleave (stream-map (lambda (x) (cons (stream-car s) x))
                                       (stream-cdr (pairs t u)))
                           (triples (stream-cdr s)
                                    (stream-cdr t)
                                    (stream-cdr u)))))

(load "66_interleave.scm")

(define ttt (triples integers integers integers))
;; (1 1 1)
;; (1 1 2)
;; (2 2 2)
;; (1 2 2)
;; (2 2 3)
;; (1 1 3)
;; (3 3 3)
;; (1 2 3)
;; (2 3 3)
;; (1 1 4)

(define (pythagoras? stu)
  (= (+ (square (car stu))
        (square (cadr stu)))
     (square (caddr stu))))

(define pythagorean-triplets
  (stream-filter pythagoras?
                 ttt))
;; (3  4  5)
;; (6  8 10)
;; (5 12 13)
;; (9 12 15)
;; (8 15 17)
