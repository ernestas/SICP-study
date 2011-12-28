;; Order must be used to prevent brief changes
;; in wire states during propagation delay.

(load "29_and_gate.scm")
(load "28_wire.scm")

;; test with wrong order

(load "28_agenda.scm")

(define and-gate-delay 5)

(define input-1 (make-wire))
(define input-2 (make-wire))
(define output (make-wire))
(probe 'output output)
(and-gate input-1 input-2 output)
(newline)

(set-signal! input-2 1)
(set-signal! input-1 0)
(propagate)
(newline)

(set-signal! input-1 1)
(set-signal! input-2 0)
(propagate)

(newline)(display "**********")(newline)(newline)

;; test with correct order

(load "28_agenda.scm")

(define input-a (make-wire))
(define input-b (make-wire))
(define out (make-wire))
(probe 'out out)
(and-gate input-a input-b out)
(newline)

(set-signal! input-b 1)
(set-signal! input-a 0)
(propagate)
(newline)

(set-signal! input-b 0)
(set-signal! input-a 1)
(propagate)
