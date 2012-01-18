;; mit-scheme

;; partial-sums
(define (partial-sums s)
  (cons-stream (stream-car s)
               (add-streams (stream-cdr s)
                            (partial-sums s))))

;; integers
(load "54_integers.scm")

;; add-streams
(define (add-streams s1 s2)
  (stream-map + s1 s2))

;; tests

(stream-ref (partial-sums integers) 4)

;1 ]=> (load "55.scm")
;
;;Loading "55.scm"... done
;;Value: 15
