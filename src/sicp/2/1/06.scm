;; FUN

;; 0
(define zero
  (lambda (f) (lambda (x) x)))

;; add-1
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; 1
; (add-1 zero)
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

;; 2
; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f (((lambda (ff) (lambda (xx) (ff xx))) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (xx) (f xx)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; 3
; function f gets applied 1 extra time
; after each addition of 1
(define three
  (lambda (f) (lambda (x) (f (f (f x))))))

;; add
; this is way out of the league of my brain
; TODO: review lambda calculus
(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))


;; tests
(define (square x) (* x x))
((two square) 2)
(define (identity x) x)
(((add two one) identity) 1)
(((add two one) square) 2)
