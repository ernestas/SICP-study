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

;; below

(define (below p1 p2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-top (transform-painter p1
                                        (make-vect 0.0 0.0)
                                        (make-vect 1.0 0.0)
                                        split-point))
          (paint-bottom (transform-painter p2
                                           split-point
                                           (make-vect 1.0 0.5)
                                           (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))

;; below-2

(define (below-2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))

;; tests

(paint (below einstein einstein))
(newline)
(paint (below-2 einstein einstein))