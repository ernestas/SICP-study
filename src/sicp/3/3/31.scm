;; make-wire specifies that when a new action procedure is added to a wire,
;; the procedure is immediately run.
;;
;; This initialization is necessary because a 'digital box' (gate/inverter/...)
;; that is added calls after-delay, which adds it to the agenda.
;; Otherwise the agenda will be empty and simulation will not start.
