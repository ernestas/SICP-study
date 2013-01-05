;; mit-scheme

;; integers
(load "54_integers.scm")

;; scale-stream
(load "56_scale.scm")

;; a

;; integrate
(define (integrate-series s)
  (stream-map / s integers))

;; b

;; cos
(define cosine-series
  (cons-stream 1 (scale-stream (integrate-series sine-series)
                               -1)))
;; sin
(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
