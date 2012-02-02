;; TODO: review

(define (smooth s)
  (stream-map average
              s
			  (stream-cdr s)))
