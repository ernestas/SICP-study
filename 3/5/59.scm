;; mit-scheme

(load "59_integrate_sin_cos.scm")

;; tests

(stream-ref sine-series 3) ;; Value: -1/6
(stream-ref cosine-series 2) ;; Value: -1/2
