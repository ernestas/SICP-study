;; Dr-Racket

;; streams
(require racket/stream)

;; stream-enumerate-interval
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons low
                   (stream-enumerate-interval (+ low 1) high))))

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
(newline)
(stream-ref x 7)
;; ^^ would output:
;;
;;     6
;;     7
;;     7
;;
;; if memo-prod was used
