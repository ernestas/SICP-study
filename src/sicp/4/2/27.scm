;; (define count 0)
;; (define (id x) (set! count (+ count 1)) x)
;; (define w (id (id 10)))
;; ;;; L-Eval input:
;; count
;; ;;; L-Eval value:
;; 1
;; ;;; L-Eval input:
;; w
;; ;;; L-Eval value:
;; 10
;; ;;; L-Eval input:
;; count
;; ;;; L-Eval value:
;; 2

;; Definition only forces outer id. `(id 10)` is a parameter and is not forced
;; until evaluation of `w`.
