;; integers
(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))

;; alternative version
(load "55_add.scm")
(define ones (cons-stream 1
                          ones))
(define integers (cons-stream 1
                              (add-streams integers
                                           ones)))
