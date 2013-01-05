;; mit-scheme

(load "59_integrate_sin_cos.scm")

(load "55_add.scm")
(load "60_mul.scm")

;; tests

(define one (add-streams (mul-series sine-series
                                     sine-series)
                         (mul-series cosine-series
                                     cosine-series)))

(stream-ref one 0)

;1 ]=> (load "60.scm")
;
;;Loading "60.scm"...
;;  Loading "59.scm"... done
;;... done
;;Value: 1
