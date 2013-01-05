;; a

;; (define x 3)
;;
;; Evaluator will treat this expression as a procedure application. It will
;; call the procedure 'define' on arguments 'x' and '3'.

;; b

(define (application? exp)
  (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))
