; Tpq(a,b) = {a <- bq + aq + ap
;            {b <- bp + aq

; Tp'q'(a,b) = {a <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;              {b <- (bp + aq)p + (bq + aq + ap)q
;
;            = {a <- bpq + aqq + bqq + aqq + apq + bpq + aqp + app
;              {b <- bpp + apq + bqq + aqq + apq
;
;            = {a <- (2pq + qq)b + (2pq + qq)a + (qq + pp)a
;              {b <- (qq + pp)b + (2pq + qq)a

; p' = pp + qq
; q' = 2pq + qq

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                 b
                                 (+ (* p p) (* q q))	; compute p'
                                 (+ (* 2 p q) (* q q))	; compute q'
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
