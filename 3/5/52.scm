;; mit-scheme

;; enumerate-interval
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream (cons-stream
                        low (stream-enumerate-interval (+ low 1) high))))

;; display
(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x)
  (newline)
  (display x))

;; tests

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum) ;; 0

(define seq (stream-map accum
                        (stream-enumerate-interval 1 20))) ;; 1

(define y (stream-filter even? seq)) ;; 6

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq)) ;; 10

(stream-ref y 7)   ;; 136
(display-stream z) ;; 210

;1 ]=> (load "52.scm")
;
;;Loading "52.scm"...
;10
;15
;45
;55
;105
;120
;190
;210
;;... done
;;Unspecified return value
