(load "28_or_gate.scm")

;; tests

(load "28_wire.scm")
(load "28_agenda.scm")

(define or-gate-delay 5)

(define input-1 (make-wire))
(define input-2 (make-wire))
(define output (make-wire))
(probe 'output output)
(or-gate input-1 input-2 output)
(newline)

(set-signal! input-1 1)
(propagate)
(newline)

(set-signal! input-1 0)
(propagate)
(newline)

(set-signal! input-1 1)
(propagate)
(newline)
