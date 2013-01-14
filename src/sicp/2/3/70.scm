;; leafs and trees
(load "67_leafs_and_trees.scm")

;; encode

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((element-of-set? symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((element-of-set? symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

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

(define sample-tree
  (generate-huffman-tree '((a 2) (boom 1) (get 2) (job 2)
                           (na 16) (sha 3) (yip 9) (wah 1))))

(define sample-message '(get a job sha na na na na na na na na
                         get a job sha na na na na na na na na
                         wah yip yip yip yip yip yip yip yip yip
                         sha boom))

(define sample-message-encoded (encode sample-message
                                       sample-tree))

sample-tree
(newline)
(display sample-message-encoded)
(newline)
(length sample-message-encoded)
;; fixed length encoding to encode 8 symbols
;; would need 3 bits (8 = 2^3) per symbol
(* 3 (length sample-message))
