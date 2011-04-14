(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((and (>= ux 0) (< lx 0) ; x-+ y++
                (>= uy 0) (>= ly 0))
           (let ((a (* uy lx))
                 (b (* uy ux)))
             (make-interval (min a b)
                            (max a b))))
          
          ((and (>= ux 0) (< lx 0) ; x-+ y--
                (< uy 0) (< ly 0))
           (let ((a (* yl lx))
                 (b (* yl ux)))
             (make-interval (min a b)
                            (max a b))))
          
          ((and (>= ux 0) (< lx 0) ; x-+ y-+
                (>= uy 0) (< ly 0))
           (let ((p1 (* (lower-bound x) (lower-bound y)))
                 (p2 (* (lower-bound x) (upper-bound y)))
                 (p3 (* (upper-bound x) (lower-bound y)))
                 (p4 (* (upper-bound x) (upper-bound y))))
             (make-interval (min p1 p2 p3 p4)
                            (max p1 p2 p3 p4))))
          
          ((and (>= ux 0) (>= lx 0) ; x++ y-+
                (>= uy 0) (< ly 0))
           (let ((a (* ux ly))
                 (b (* ux uy)))
             (make-interval (min a b)
                            (max a b))))
          
          ((and (>= ux 0) (>= lx 0) ; x++ y++
                (>= uy 0) (>= ly 0))
           (let ((a (* lx ly))
                 (b (* ux uy)))
             (make-interval (min a b)
                            (max a b))))
          
          ((or (and (< ux 0) (< lx 0) ; x-- y++ OR x++ y--
                    (>= uy 0) (>= ly 0))
               (and (>= ux 0) (>= lx 0)
                    (< uy 0) (< ly 0)))
           (let ((a (* lx uy))
                 (b (* ux ly)))
             (make-interval (min a b)
                            (max a b))))
          
          ((and (< ux 0) (< lx 0) ; x-- y-+
                (>= uy 0) (< ly 0))
           (let ((a (* lx uy))
                 (b (* ux ly)))
             (make-interval (min a b)
                            (max a b))))
          
          ((and (< ux 0) (< lx 0) ; x-- y--
                (< uy 0) (< ly 0))
           (let ((a (* ux uy))
                 (b (* lx ly)))
             (make-interval (min a b)
                            (max a b))))
          )))

;; interval abstraction

(define (make-interval a b) (cons a b))
; assuming 1st is loweb-bound and 2nd is upper bound
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))