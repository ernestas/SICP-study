;; mit-scheme

(load "59_integrate_sin_cos.scm")

(load "60_add.scm")
(load "60_mul.scm")

(load "61_invert.scm")

;; tests

(stream-ref (invert-unit-series sine-series) 3) ;; Value: -5/6
(stream-ref (invert-unit-series cosine-series) 2) ;; Value 1/2
