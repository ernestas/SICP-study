;; usues De Morgan's laws
;; this or-gate delay is (+ and-gate-delay (* 2 inverter-delay))
(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((not-a1 (make-wire))
          (not-a2 (make-wire))
          (not-a1-and-not-a2 (make-wire)))
      (inverter a1 not-a1)
      (inverter a2 not-a2)
      (and-gate not-a1 not-a2 not-a1-and-not-a2)
      (inverter not-a1-and-not-a2 output)))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(load "29_inverter.scm")
(load "29_and_gate.scm")

;; tests

(load "28_wire.scm")
(load "28_agenda.scm")

(define inverter-delay 2)
(define and-gate-delay 3)
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
