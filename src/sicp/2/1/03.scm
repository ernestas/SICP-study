(define (square x) (* x x))

;; point

(define (make-point x y)
  (cons x y))

(define (x-point pt)
  (car pt))

(define (y-point pt)
  (cdr pt))

(define (point-distance a b)
  (sqrt (+ (square (- (x-point a) (x-point b)))
           (square (- (y-point a) (y-point b))))))

;; segment

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (segment-length s)
  (point-distance (start-segment s)
                  (end-segment s)))

;; rectangle
;; stores 2 perpendicular segments

(define (make-rectangle w h)
  (cons w h))

(define (rectangle-width r)
  (segment-length (car r)))

(define (rectangle-height r)
  (segment-length (cdr r)))

;; perimeter & area

(define (rectangle-perimeter r)
  (+ (* 2 (rectangle-width r))
     (* 2 (rectangle-height r))))

(define (rectangle-area r)
  (* (rectangle-width r)
     (rectangle-height r)))

;; tests

(define r (make-rectangle (make-segment (make-point 1 3)
                                        (make-point 3 1))
                          (make-segment (make-point 3 1)
                                        (make-point 6 4))))
(rectangle-perimeter r)
(rectangle-area r)

;; rectangle can be implemented in a different representation
;; as long as it is possible to return width & height
;; perimeter & area will work
