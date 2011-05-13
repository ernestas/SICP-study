;; tree constructor and getters

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

;; lookup

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      false
      (let ((entry-object (entry set-of-records)))
        (cond ((= given-key entry-object) entry-object)
              ((< given-key entry-object) (lookup given-key (left-branch set-of-records)))
              ((> given-key entry-object) (lookup given-key (right-branch set-of-records)))))))

;; tests

(define tree-1 (make-tree 7
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     (make-tree 5 '() '()))
                          (make-tree 9
                                     '()
                                     (make-tree 11 '() '()))))

(lookup 1 tree-1)
(lookup 5 tree-1)
(lookup 11 tree-1)
(lookup 12 tree-1)