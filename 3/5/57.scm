;; mit-scheme

;; n-1 or O(n)
;; φ^n or O(2^n)

;; add-streams
(define (add-streams s1 s2)
  (stream-map plus s1 s2))

;; plus
(define n-sums 0)
(define (plus a b)
  (set! n-sums (+ 1 n-sums))
  (+ a b))

;; fibs
(define fibs (cons-stream 0
                          (cons-stream 1
                                       (add-streams (stream-cdr fibs)
                                                    fibs))))

;; tests

(stream-ref fibs 100)
n-sums ;; 99

;1 ]=> (load "57.scm")
;
;;Loading "57.scm"... done
;;Value: 354224848179261915075
