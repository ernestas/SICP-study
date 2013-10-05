(load "35_evaluator.scm")

(define the-global-environment (setup-environment))

(interpret '(define (require p) (if (not p) (amb))))

(interpret '(define (an-integer-between low high)
              (require (<= low high))
              (amb low (an-integer-between (+ 1 low) high))))

(interpret '(define (an-integer-starting-from n)
              (amb n (an-integer-starting-from (+ n 1)))))

;; Simply replacing an-integer-between by an-integer-starting-from in the
;; procedure in Exercise 4.35 is not an adequate way to generate arbitrary
;; Pythagorean triples because of a chronological backtracking which will
;; increment k to infinity.

(interpret '(define (a-pythagorean-triple-from n)
              (let ((k (an-integer-starting-from n)))
                (let ((i (an-integer-between n k)))
                  (let ((j (an-integer-between i k)))
                    (require (= (+ (* i i) (* j j)) (* k k)))
                    (list i j k))))))

(load "35_repl.scm")
