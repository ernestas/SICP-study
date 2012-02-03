;; integral

(define (integral delayed-integrand initial-value dt)
  (cons-stream initial-value
               (let ((integrand (force delayed-integrand)))
                 (if (stream-null? integrand)
                     the-empty-stream
                     (integral (delay (stream-cdr integrand))
                               (+ (* dt (stream-car integrand))
                                  initial-value)
                               dt)))))

;; solve

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

;; tests

(stream-ref (solve (lambda (y) y)
                   1
                   0.001)
            1000)

;; 1 ]=> (load "77.scm")
;;
;; ;Loading "77.scm"... done
;; ;;Value: 2.716923932235896
