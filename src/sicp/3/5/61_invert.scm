;; invert-unit-series
(define (invert-unit-series s)
  (cons-stream 1
               (scale-stream (mul-series (stream-cdr s)
                                         (invert-unit-series s))
                             -1)))
