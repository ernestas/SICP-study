(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; interval abstraction

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;; tests

(define interval-a (make-interval 1 3))
(define interval-b (make-interval 2 4))

(sub-interval interval-a interval-b)
(sub-interval interval-b interval-a)
