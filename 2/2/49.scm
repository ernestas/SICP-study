;; The SICP Picture Language
;; http://planet.plt-scheme.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;; predefined frame corner vectors

(define tl (make-vect 0.00 0.99))
(define tr (make-vect 0.99 0.99))
(define bl (make-vect 0.00 0.00))
(define br (make-vect 0.99 0.00))

;; a

(define painter-outline
  (segments->painter (list (make-segment bl tl)
                           (make-segment tl tr)
                           (make-segment tr br)
                           (make-segment br bl))))

;; b

(define painter-x
  (segments->painter (list (make-segment bl tr)
                           (make-segment br tl))))

;; predefined 'diamond shape in the frame' corner vectors

(define l (make-vect 0.0 0.5))
(define t (make-vect 0.5 1.0))
(define r (make-vect 1.0 0.5))
(define b (make-vect 0.5 0.0))

;; c

(define painter-diamond
  (segments->painter (list (make-segment l t)
                           (make-segment t r)
                           (make-segment r b)
                           (make-segment b l))))

;; d

(define painter-wave
  (segments->painter (append (list (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.33))
                                   (make-segment (make-vect 0.50 0.33) (make-vect 0.60 0.00)))
                             (list (make-segment (make-vect 0.25 0.00) (make-vect 0.33 0.50))
                                   (make-segment (make-vect 0.33 0.50) (make-vect 0.30 0.60))
                                   (make-segment (make-vect 0.30 0.60) (make-vect 0.10 0.40))
                                   (make-segment (make-vect 0.10 0.40) (make-vect 0.00 0.60)))
                             (list (make-segment (make-vect 0.00 0.80) (make-vect 0.10 0.60))
                                   (make-segment (make-vect 0.10 0.60) (make-vect 0.33 0.65))
                                   (make-segment (make-vect 0.33 0.65) (make-vect 0.40 0.65))
                                   (make-segment (make-vect 0.40 0.65) (make-vect 0.35 0.80))
                                   (make-segment (make-vect 0.35 0.80) (make-vect 0.40 1.00)))
                             (list (make-segment (make-vect 0.75 0.00) (make-vect 0.60 0.45))
                                   (make-segment (make-vect 0.60 0.45) (make-vect 1.00 0.15)))
                             (list (make-segment (make-vect 1.00 0.35) (make-vect 0.80 0.65))
                                   (make-segment (make-vect 0.80 0.65) (make-vect 0.60 0.65))
                                   (make-segment (make-vect 0.60 0.65) (make-vect 0.65 0.80))
                                   (make-segment (make-vect 0.65 0.80) (make-vect 0.60 1.00))))))

;; testing

(paint painter-outline)
(newline)
(paint painter-x)
(newline)
(paint painter-diamond)
(newline)
(paint painter-wave)
