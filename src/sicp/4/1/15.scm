(define (run-forever) (run-forever))

(define (try p)
  (if (halts? p p)
      (run-forever)
      'halted))

(try try)

;; (p p) halts -> (try p) runs forever
;; (p p) runs forever -> (try p) halts

;; (try try) halts -> (try try) runs forever
;; (try try) runs forever -> (try try) halts
