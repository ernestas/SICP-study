;; *****
;; put & get procedures
;; NOTE: not yet covered in the book
;; used solely for the purposes of testing
(define *op-table* (make-hash-table 'equal))
(define (put op type proc)
  (hash-table-put! *op-table* (list op type) proc))
(define (get op type)
  (hash-table-get *op-table* (list op type) '()))
;; *****
