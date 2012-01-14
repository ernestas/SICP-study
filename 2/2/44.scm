;; The SICP Picture Language
;; http://planet.plt-scheme.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;; up-split

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

;; tests

(paint (up-split einstein 1))
(newline)
(paint (up-split einstein 2))
