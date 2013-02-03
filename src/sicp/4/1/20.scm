;; a

(load "20_evaluator.scm")
(load "../../../../vendor/test-manager/load.scm")
(load "20_test.scm")

(define the-global-environment (setup-environment))
(run-registered-tests)

;; b

;; (define (f x)
;;   (letrec ((even? (lambda (n) (if (= n 0) true (odd? (- n 1)))))
;;            (odd? (lambda (n) (if (= n 0) false (even? (- n 1))))))
;;     〈rest of body of f〉))

;; ((lambda (even? odd?)
;;    (set! even? (lambda (n) (if (= n 0) true (odd? (- n 1)))))
;;    (set! odd? (lambda (n) (if (= n 0) false (even? (- n 1)))))
;;    〈rest of body of f〉)
;;  '*unassigned*
;;  '*unassigned*)

;; (define (f x)
;;   (let ((even? (lambda (n) (if (= n 0) true (odd? (- n 1)))))
;;         (odd? (lambda (n) (if (= n 0) false (even? (- n 1))))))
;;     〈rest of body of f〉))

;; ((lambda (even? odd?)
;;    〈rest of body of f〉)
;;  (lambda (n) (if (= n 0) true (odd? (- n 1))))
;;  (lambda (n) (if (= n 0) false (even? (- n 1)))))
