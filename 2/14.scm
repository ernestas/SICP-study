;; parallel

(define (par1 r1 r2) 
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;; interval arithmetic

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

;; center + percent

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-interval (- c w) (+ c w))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent i)
  (* (/ (width i) (center i)) 
     100))

;; interval abstraction

(define (make-interval a b) (cons a b))
; assuming 1st is loweb-bound and 2nd is upper bound
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;; tests

(define a (make-center-percent 10 2))
(define b (make-center-percent 20 1))

(define ab1 (par1 a b))
(center ab1)
(percent ab1)
(newline)

(define ab2 (par2 a b))
(center ab2)
(percent ab2)
(newline)

(define aa1 (par1 a a))
(center aa1)
(percent aa1)
(newline)

(define aa2 (par2 a a))
(center aa2)
(percent aa2)
