(define s (cons-stream 1
                       (add-streams s s)))

;; 1
;; the first value of (add-streams s s) stream will be 1 + 1 = 2
;; second time around 4
;; 8
;; 16
;; 32
;; 64
