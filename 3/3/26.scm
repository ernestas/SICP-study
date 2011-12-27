;; tree getters, constructor and lookup
;; like in 2/3/66.scm

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (lookup-tree given-key records)
  (if (null? records)
      false
      (let ((entry-object (entry records)))
        (cond ((= given-key (key entry-object)) entry-object)
              ((< given-key (key entry-object)) (lookup-tree given-key (left-branch records)))
              ((> given-key (key entry-object)) (lookup-tree given-key (right-branch records)))))))
(define (key record)
  (car record))

;; tree adjoin-set

(define (adjoin-set x set)
  (define (entry-equal? a b)
    (= (key a) (key b)))
  (define (entry-less-than? a b)
    (< (key a) (key b)))
  (define (entry-more-than? a b)
    (> (key a) (key b)))
  (cond ((null? set) (make-tree x '() '()))
        ((entry-equal? x (entry set)) set)
        ((entry-less-than? x (entry set)) (make-tree (entry set)
                                                     (adjoin-set x (left-branch set))
                                                     (right-branch set)))
        ((entry-more-than? x (entry set)) (make-tree (entry set)
                                                     (left-branch set)
                                                     (adjoin-set x (right-branch set))))))

;; make-table using binary tree

(define (make-table)
  
  (let ((local-table (list '*table*)))
    
    (define (lookup keys)
      (define (lookup-iter keys table)
        (let ((subtable (lookup-tree (car keys) (cdr table))))
          (if subtable
              (if (null? (cdr keys))
                  (cdr subtable)
                  (lookup-iter (cdr keys) subtable))
              false)))
      (lookup-iter keys local-table))
    
    (define (insert! keys value)
      (define (new-table keys)
        (if (null? (cdr keys))
            (cons (car keys) value)
            (cons (car keys)
                  (make-tree (new-table (cdr keys))
                             '() '()))))
      (define (insert-iter! keys table)
        (let ((subtable (lookup-tree (car keys) (cdr table))))
          (if subtable
              (if (null? (cdr keys))
                  (set-cdr! subtable value)
                  (insert-iter! (cdr keys) subtable))
              (set-cdr! table
                        (adjoin-set (new-table keys)
                                    (cdr table)))))
        'ok)
      (insert-iter! keys local-table))
    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

;; tests

(define table (make-table))

((table 'insert-proc!) '(1 2 3) 123)
((table 'insert-proc!) '(1 2 4) 124)
((table 'insert-proc!) '(1 2 1) 121)
((table 'lookup-proc) '(1 2 3))
((table 'lookup-proc) '(1 2 4))
((table 'lookup-proc) '(1 2 1))