(define (solve f y0 dt)
  (let ((y '*unassigned*)
        (dy '*unassigned*))
    (let ((a (integral (delay dy) y0 dt))
          (b (stream-map f y)))
      (set! y a)
      (set! dy b))
    y))

;; This will not work, since when the inner let is transformed into a lambda its
;; second parameter (stream-map f y) cannot be evaluated because y is
;; *unassigned* at that point.
