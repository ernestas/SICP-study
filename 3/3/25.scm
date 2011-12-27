(define (make-table same-key?)
  (define (assoc-cust key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (assoc-cust key (cdr records)))))
  (let ((local-table (list '*table*)))
    
    (define (lookup keys)
      (define (lookup-iter keys table)
        (let ((subtable (assoc-cust (car keys) (cdr table))))
          (if subtable
              (if (null? (cdr keys))
                  (cadr subtable)
                  (lookup-iter (cdr keys) subtable))
              false)))
      (lookup-iter keys local-table))
    
    (define (insert! keys value)
      (define (new-table keys)
        (if (null? keys)
            value
            (list (car keys) (new-table (cdr keys)))))
      (define (insert-iter! keys table)
        (let ((subtable (assoc-cust (car keys) (cdr table))))
          (if subtable
              (if (null? (cdr keys))
                  (set-cdr! subtable (list value))
                  (insert-iter! (cdr keys) subtable))
              (set-cdr! table
                        (cons (new-table keys)
                              (cdr table)))))
        'ok)
      (insert-iter! keys local-table))
    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

;; tests

(define table (make-table equal?))

((table 'insert-proc!) '(num rat two) 2)
((table 'insert-proc!) '(num rat five) 5)
((table 'lookup-proc) '(num rat two))
((table 'lookup-proc) '(num rat five))