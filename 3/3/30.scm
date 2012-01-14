;; Delay is (+ 3 (* 2 (- n 1))) where n is the number of bits
;;
;; 3 (for carry propagation in first adder) +
;; (n - 1) * 2 (for carry propagation in later adders)
;;
;; In terms of gate delays:
;;
;; (* n full-adder-delay)
;;
;; (* n (+ (* 2 half-adder-delay)
;;         or-gate-delay))
;;
;; (* n (+ (* 2 (+ (max (+ and-gate-delay inverter-delay)
;;                      or-gate-delay)
;;                 and-gate-delay))
;;         or-gate-delay))

(define (ripple-carry-adder A B S C)
  (let ((c-in (make-wire)))
    (if (null? (cdr A))
        (set-signal! c-in 0)
        (ripple-carry-adder (cdr A) (cdr B) (cdr S) c-in))
    (full-adder (car A) (car B) c-in (car S) C)))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(load "28_or_gate.scm")
(load "29_inverter.scm")
(load "29_and_gate.scm")

;; tests

(load "28_wire.scm")
(load "28_agenda.scm")

(define inverter-delay 2)
(define and-gate-delay 3)
(define or-gate-delay 5)

(define a1 (make-wire))
(define a2 (make-wire))
(define a3 (make-wire))
(define b1 (make-wire))
(define b2 (make-wire))
(define b3 (make-wire))
(define s1 (make-wire))
(define s2 (make-wire))
(define s3 (make-wire))
(define c (make-wire))
(probe 's1 s1)
(probe 's2 s2)
(probe 's3 s3)
(probe 'c c)

(ripple-carry-adder (list a1 a2 a3)
                    (list b1 b2 b3)
                    (list s1 s2 s3)
                    c)
(newline)

(set-signal! a3 1)
(set-signal! a2 1)
(propagate)
(newline)


(set-signal! b2 1)
(propagate)
(newline)

(set-signal! a1 1)
(propagate)
(newline)
