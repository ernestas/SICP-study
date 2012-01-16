;; mit-scheme

;; enumerate-interval
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream (cons-stream
                        low (stream-enumerate-interval (+ low 1) high))))

;; display-line
(define (display-line x)
  (display x)
  (newline))

;; tests

(define (show x)
  (display-line x)
  x)

(define x (stream-map show
                      (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)

;1 ]=> (load "51_mit_scheme.scm")
;
;;Loading "51_mit_scheme.scm"... 0
;1
;2
;3
;4
;5
;6
;7
;;... done
;;Value: 7
