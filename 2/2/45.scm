;; The SICP Picture Language
;; http://planet.plt-scheme.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

;; split

(define (split pos1 pos2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split pos1 pos2) painter (- n 1))))
          (pos1 painter (pos2 smaller smaller))))))

;; right-split & up-split

(define right-split (split beside below))
(define up-split (split below beside))

;; tests

(paint (right-split einstein 2))
(newline)
(paint (up-split einstein 2))
