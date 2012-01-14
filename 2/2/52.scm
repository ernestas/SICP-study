;; The SICP Picture Language
;; http://planet.plt-scheme.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;; a

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
                                   (make-segment (make-vect 0.65 0.80) (make-vect 0.60 1.00)))
                             (list (make-segment (make-vect 0.50 0.70) (make-vect 0.55 0.75))
                                   (make-segment (make-vect 0.50 0.70) (make-vect 0.45 0.75)))
                             (list (make-segment (make-vect 0.45 0.85) (make-vect 0.45 0.86)))
                             (list (make-segment (make-vect 0.55 0.85) (make-vect 0.55 0.86))))))

;; b

; split

(define (split pos1 pos2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split pos1 pos2) painter (- n 1))))
          (pos1 painter (pos2 smaller smaller))))))

; right-split & up-split

(define right-split (split beside below))
(define up-split (split below beside))

; corner-split

(define (corner-split painter n)
  (if (= n 0)
      painter
      (beside (below painter (up-split painter (- n 1)))
              (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))

;; c

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert
                                  rotate180
                                  identity
                                  flip-horiz)))
    (combine4 (corner-split painter n))))

;; tests

(paint painter-wave)
(newline)
(paint (corner-split einstein 2))
(newline)
(paint (square-limit einstein 2))
