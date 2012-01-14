;; sum & difference

; interval = (x, y)

; width = (y - x) / 2
; y = 2w + x

; interval = (x, 2w + x)

; sum-interval = interval + interval
; sum-interval = (x1, 2w1 + x1) + (x2, 2w2 + x2)
; sum-interval = (x1 + x2, x1 + x2 + 2w1 + 2w2)

; width of the interval = (y - x) / 2
; width of the sum-interval = ((x1 + x2 + 2w1 + 2w2) - (x1 + x2)) / 2
; width of the sum-interval = (2w1 + 2w2) / 2
; width of the sum-interval = w1 + w2

; width of the sum of two intervals is a function
; only of the widths of the intervals being added.
; same can be shown for difference.


;; multiplication & division

; multiplying intervals with same widths
; should give same width in the answer

; (mul-interval (make-interval -2 2) ; w = 4
;               (make-interval -3 3)) ; w = 6
; answer = (-6 . 6) ; w = 12

; (mul-interval (make-interval 0 4) ; w = 4
;               (make-interval 0 6)) ; w = 6
; answer = (0 . 24) ; w = 24

; which it does not, thus proving that
; width of the multiplication of two intervals
; is not a function only of the widths of the
; intervals being multiplied.
; same can be shown for division.
