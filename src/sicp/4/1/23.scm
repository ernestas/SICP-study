;; (exp1)
;; (lambda (env)
;;   (execute-sequence ((analyze exp1)) env))

;; (exp1)
;; (analyse exp1)

;; (exp1 exp2)
;; (lambda (env)
;;   (execute-sequence ((analyze exp1) (analyze exp2)) env))

;; (exp1 exp2)
;; (lambda (env)
;;   ((analyze exp1) env)
;;   ((analyze exp2) env))
