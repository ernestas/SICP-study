;; mit-scheme

(load "../../1/2/28_prime.scm")

;; enumerate-interval
(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream (cons-stream
                        low (stream-enumerate-interval (+ low 1) high))))

;; stream-map from the book
(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

;; stream-map generalized
(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

;; display
(define (display-stream s)
  (stream-for-each display-line s))
(define (display-line x)
  (newline)
  (display x))

;; tests

(stream-car
 (stream-cdr
  (stream-filter prime? (stream-enumerate-interval 10000 10010))))

(define s1 (stream-enumerate-interval 1  10))
(define s2 (stream-enumerate-interval 10 20))

(define ss (stream-map + s1 s2))

(display-stream ss)

;1 ]=> (load "50.scm")
;
;;Loading "50.scm"...
;;  Loading "../../1/2/28_prime.scm"... done
;
;11
;13
;15
;17
;19
;21
;23
;25
;27
;29
;;... done
;;Unspecified return value
