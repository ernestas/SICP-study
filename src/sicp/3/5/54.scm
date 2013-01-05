;; mit-scheme

;; mul-streams
(define (mul-streams s1 s2)
  (stream-map * s1 s2))

;; integers
(load "54_integers.scm")

;; factorials
(define factorials (cons-stream 1
                                (mul-streams integers
                                             factorials)))

;; tests

(stream-ref factorials 6)

;1 ]=> (load "54.scm")
;
;;Loading "54.scm"... done
;;Value: 720
