;; mit-scheme

(load "54_integers.scm")

(load "66_pairs.scm")

(load "66_interleave.scm")

(pairs integers integers)
;; pair | position
;; ==============
;; (1 1)
;; (1 2) ;2
;; (2 2)
;; (1 3) ;4
;; (2 3)    ;5
;; (1 4) ;6
;; (3 3)
;; (1 5) ;8
;; (2 4)    ;9
;; (1 6) ;10

;; (1 n) appears every second element or on position 2n-2
;; so (1 100) will appear at 198 and 197 pairs precede it

;; (2 n) appears every 4th element
;; (3 n) appears every 8th element
;; ...
;; (m n) appears every 2^m element

;; (99 100) or (m n) will appear at
;; 2^(m-1) + 2^(n-1) - 2
;; or
;;   950,737,950,171,172,051,122,527,404,030

;; (100 100) or (n n) will appear at
;; 2^(n-1) + 2^(n-1) - 2
;; or
;; 2^99 + 2^99 - 2
;; or
;; 2^100 - 2
;; or
;; 1,267,650,600,228,229,401,496,703,205,374
