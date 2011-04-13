(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y)) 
                               (/ 1.0 (lower-bound y)))))

;; interval abstraction

(define (make-interval a b) (cons a b))
; assuming 1st is loweb-bound and 2nd is upper bound
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;; tests

(add-interval (make-interval 1 3)
              (make-interval 2 4))

(mul-interval (make-interval 1 3)
              (make-interval 2 4))