;; leafs and trees
(include "67_leafs_and_trees.scm")

;; generate huffman tree

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (<= (length set) 1)
      (car set)
      (successive-merge (adjoin-set (make-code-tree (car set)
                                                    (cadr set))
                                    (cddr set)))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

;; tests

;; n = 5
;;  most frequent: 1 bit
;; least frequent: 4 bits
(generate-huffman-tree '((a 1) (b 2) (c 4) (d 8) (e 16)))
(newline)

;; n = 10
;;  most frequent: 1 bit
;; least frequent: 9 bits
(generate-huffman-tree '((a 1) (b 2) (c 4) (d 8) (e 16) (f 32) (g 64) (h 128) (i 256) (j 512)))

;; for any n:
;;  most frequent: 1 bit
;; least frequent: (n - 1) bits
