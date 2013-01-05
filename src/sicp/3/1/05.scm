;; given

(define (random-in-range low high)
  (let ((range (- high low)))
    ;; changed a little to make it run in DrRacket
    (+ low (* (random) range))))
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

;; estimate integral

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (P (random-in-range x1 x2)
       (random-in-range y1 y2)))
  (* (rect-area x1 x2 y1 y2)
     (monte-carlo trials experiment)))

(define (rect-area x1 x2 y1 y2)
  (abs (* (- x2 x1) (- y2 y1))))
(define (square x)
  (* x x))

;; π

(define (estimate-pi trials)
  (define (P x y)
    (<= (+ (square x) (square y))
        1))
  (estimate-integral P -1.0 1.0 -1.0 1.0 trials))

;; tests

(estimate-pi 100000)

(define (P x y)
  (< (+ (expt (- x 5) 2)
        (expt (- y 7) 2))
     (expt 3 2)))
(estimate-integral P 2.0 8.0 4.0 10.0 100000)
