;; TODO: review

(define (RLC R L C dt)
  (lambda (vC0 iL0)
    (define vC (integral (delay dvc) vC0 dt))
	(define iL (integral (delay dil) iL0 dt))
	(define dvc (scale-stream iL (/ -1 C)))
	(define dil (add-streams (scale-stream iL (- (/ R L)))
                             (scale-stream vC (/ 1 L))))
	(cons vC iL)))

;; tests

(define RLC-80 (RLC 1 0.2 1 0.1))

(RLC-80 10 0)
