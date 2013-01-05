;; center + width

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


;; center + percent

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-interval (- c w) (+ c w))))

(define (percent i)
  (* (/ (width i) (center i))
     100))


;; interval abstraction

(define (make-interval a b) (cons a b))
; assuming 1st is loweb-bound and 2nd is upper bound
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))


;; tests

(define a (make-center-width 3 2))
(center a)
(width a)

(newline)

(define b (make-center-percent 3 66.666666667))
(center b)
(percent b)
