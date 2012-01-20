;; mit-scheme

(load "54_integers.scm")

(define (pairs-all s t)
  (cons-stream (list (stream-car s)
                     (stream-car t))
               (interleave (interleave (stream-map (lambda (x) (list (stream-car s) x))
                                                   (stream-cdr t))
                                       (stream-map (lambda (x) (list x (stream-car t)))
                                                   (stream-cdr s)))
                           (pairs (stream-cdr s)
                                  (stream-cdr t)))))

(load "66_interleave.scm")

(pairs-all integers integers)
;; (1 1)
;; (1 2)
;; (2 2)
;; (2 1)
;; (2 3)
;; (1 3)
;; (3 3)
;; (3 1)
;; (2 4)
;; (1 4)
