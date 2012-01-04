(define a (make-connector))
(define b (make-connector))

(set-value! a 10 'user)

;; At some time during evaluation of the set-value!,
;; the following expression from the connector's local procedure is evaluated
;; (for-each-except setter inform-about-value constraints)

;; Above expression is evaluated in a newly created environment
;; which is created by applying a procedure for-each-except.
;; The new frame has as its enclosing environment
;; the environment part of the procedure object being applied.
;; That is for-each-except object which points to a global environment.