;; mit-scheme

(load "59_integrate_sin_cos.scm")

(load "60_add.scm")
(load "60_mul.scm")

(load "61_invert.scm")

;; div-series
(define (div-series s1 s2)
  (if (= 0 (stream-car s2))
      'err
      (mul-series s1 (invert-unit-series s2))))

;; tests

(define tangent-series (div-series sine-series
                                   cosine-series))

(stream-ref tangent-series 3)

;1 ]=> (load "62.scm")
;
;;Loading "62.scm"...
;;  Loading "59_integrate_sin_cos.scm"...
;;    Loading "54_integers.scm"... done
;;    Loading "56_scale.scm"... done
;;  ... done
;;  Loading "60_add.scm"... done
;;  Loading "60_mul.scm"... done
;;  Loading "61_invert.scm"... done
;;... done
;;Value: 1/3
