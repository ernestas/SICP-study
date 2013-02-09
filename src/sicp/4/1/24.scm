;; Original

(load "06_evaluator.scm")
(define the-global-environment (setup-environment))

(interpret '(define (factorial n)
              (if (= n 1)
                  1
                  (* (factorial (- n 1)) n))))

(define start-time (runtime))
(interpret '(factorial 10000))
(display (- (runtime) start-time))


;; With syntactic analysis

(load "22_evaluator.scm")
(define the-global-environment (setup-environment))

(interpret '(define (factorial n)
              (if (= n 1)
                  1
                  (* (factorial (- n 1)) n))))

(define start-time (runtime))
(interpret '(factorial 10000))
(display (- (runtime) start-time))
