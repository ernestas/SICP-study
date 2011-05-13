;; a

;; tree constructor and getters

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

;; list->tree

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

;; partial-tree creates a new tree:
;;
;; (make-tree this-entry left-tree right-tree) where
;;
;; this-entry is middle element of the list
;; or one to the left of the middle of the list
;; (in case list contains even number of elements)
;;
;; left-tree & right-tree are recursive calls to partial-tree
;; with elements to left and to the right of this-entry respectively

(define (partial-tree elements n)
  (if (= n 0)
      (cons '() elements)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elements left-size)))
          (let ((left-tree (car left-result))
                (non-left-elements (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elements))
                  (right-result (partial-tree (cdr non-left-elements) right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elements (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elements))))))))

;; tests

(list->tree '(1 3 5 7 9 11))

;       5
;     /   \
;    1     9
;     \   / \
;      3 7  11

(list->tree '(1 3 5 7 9 11 13))

;; b TODO: big O analysis
;; O(n) ?