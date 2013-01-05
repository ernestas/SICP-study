(define (make-table same-key?)

  (define (assoc-cust key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (assoc-cust key (cdr records)))))

  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc-cust key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc-cust key-2 (cdr subtable))))
              (if record (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc-cust key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc-cust key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table (cons (list key-1
                                              (cons key-2 value))
                                        (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

;; tests

(define table (make-table equal?))

((table 'insert-proc!) 'num 'two 2)
((table 'insert-proc!) 'num 'five 5)
((table 'lookup-proc) 'num 'two)
((table 'lookup-proc) 'num 'five)
