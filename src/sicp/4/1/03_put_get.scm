(define *eval-table* (make-equal-hash-table))
(define (put type proc)
  (hash-table/put! *eval-table* type proc))
(define (get type)
  (hash-table/get *eval-table* type false))