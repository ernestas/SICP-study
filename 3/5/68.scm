;; mit-scheme

(load "54_integers.scm")

;; Louis Reasoner version
(define (pairs s t)
  (interleave (stream-map (lambda (x) (list (stream-car s) x))
                          t)
              (pairs (stream-cdr s)
                     (stream-cdr t))))

(load "66_interleave.scm")

(pairs integers integers)

;1 ]=> (load "68.scm")
;
;;Loading "68.scm"...
;;  Loading "54_integers.scm"... done
;;  Loading "66_interleave.scm"... done
;;Aborting!: maximum recursion depth exceeded

;; because it doesn't use delayed evaluation
