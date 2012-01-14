;; The SICP Picture Language
;; http://planet.plt-scheme.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;; transform-painter

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame new-origin
                             (vector-sub (m corner1) new-origin)
                             (vector-sub (m corner2) new-origin)))))))

;; flip-horiz

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

;; rotate-180

(define (rotate-180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

;; rotate-270

(define (rotate-270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

;; tests

(paint einstein)
(paint (flip-horiz einstein))
(paint (rotate-180 einstein))
(paint (rotate-270 einstein))
