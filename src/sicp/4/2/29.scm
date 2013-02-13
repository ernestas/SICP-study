;; Any recursive procedure I would expect to run much more slowly without
;; memoization than with memoization.

;; Memoizes:

;; (define (square x) (* x x))
;; ;;; L-Eval input:
;; (square (id 10))
;; ;;; L-Eval value:
;; 100
;; ;;; L-Eval input:
;; count
;; ;;; L-Eval value:
;; 1

;; Doesn't memoize:

;; (define (square x) (* x x))
;; ;;; L-Eval input:
;; (square (id 10))
;; ;;; L-Eval value:
;; 100
;; ;;; L-Eval input:
;; count
;; ;;; L-Eval value:
;; 2
