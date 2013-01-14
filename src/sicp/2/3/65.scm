;; tree constructor and getters

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

;; tree->list

(define (tree->list tree)
  (if (null? tree)
      '()
      (append (tree->list (left-branch tree))
              (cons (entry tree)
                    (tree->list (right-branch tree))))))

;; list->tree

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elements n)
  (if (= n 0)
      (cons '() elements)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elements left-size)))
          (let ((left-tree (car left-result))
                (non-left-elements (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elements))
                  (right-result (partial-tree (cdr non-left-elements)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elements (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elements))))))))

;; union-set-binary-tree

(define (union-set-binary-tree set1 set2)
  (list->tree (union-set (tree->list set1)
                         (tree->list set2))))

;; union-set

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1))
                    (x2 (car set2)))
                (cond ((= x1 x2) (cons x1
                                       (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1
                                       (union-set (cdr set1) set2)))
                      ((> x1 x2) (cons x2
                                       (union-set set1 (cdr set2)))))))))

;; intersection-set-binary-tree

(define (intersection-set-binary-tree set1 set2)
  (list->tree (intersection-set (tree->list set1)
                                (tree->list set2))))

;; intersection-set

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2) (intersection-set (cdr set1) set2))
              ((< x2 x1) (intersection-set set1 (cdr set2)))))))

;; tests

(define tree-1 (make-tree 7
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     (make-tree 5 '() '()))
                          (make-tree 9
                                     '()
                                     (make-tree 11 '() '()))))

(define tree-2 (make-tree 3
                          (make-tree 1 '() '())
                          (make-tree 7
                                     (make-tree 5 '() '())
                                     (make-tree 9
                                                '()
                                                (make-tree 11 '() '())))))

(define tree-3 (make-tree 5
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     '())
                          (make-tree 9
                                     (make-tree 7 '() '())
                                     (make-tree 11 '() '()))))


(union-set-binary-tree tree-1 tree-2)
(union-set-binary-tree tree-2 tree-3)
(union-set-binary-tree tree-3 tree-1)

(intersection-set-binary-tree tree-1 tree-2)
(intersection-set-binary-tree tree-2 tree-3)
(intersection-set-binary-tree tree-3 tree-1)
