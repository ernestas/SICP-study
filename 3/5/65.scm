(define (log2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (log2-summands (+ n 1)))))

(load "55_partial_sums.scm")

(define log2-stream
  (partial-sums (log2-summands 1)))

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform
                             (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))

(define (ln2 tolerance)
  (stream-limit ln2-stream
                tolerance))

(load "64_limit.scm")

(define ln2-stream
  (accelerated-sequence euler-transform
                        log2-stream))

;; tests

(ln2 0.0001)

;1 ]=> (load "65.scm")
;
;;Loading "65.scm"...
;;  Loading "55_partial_sums.scm"...
;;    Loading "55_add.scm"... done
;;  ... done
;;  Loading "64_limit.scm"... done
;;... done
;;Value: .6931471960735491
