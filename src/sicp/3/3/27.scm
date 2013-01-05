(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result ((table 'lookup-proc) x)))
        (or previously-computed-result
            (let ((result (f x)))
              ((table 'insert-proc!) x result)
              result))))))

(define memo-fib
  (memoize (lambda (n)
             (cond ((= n 0) 0)
                   ((= n 1) 1)
                   (else (+ (memo-fib (- n 1))
                            (memo-fib (- n 2))))))))

;; 'memeoize' points to a newly created environment
;; that has 'table' variable in it
;;
;; every subsequent call to memo-fib will check
;; if it hasn't already calculated the value
;; thus calculating nth Fibonacci number
;; in a number of steps proportional to n
(memo-fib 3)

;; this will not work because fib internally calls itself
;; and not the fib version with memoize in it
(deifne memo-fib (memoize fib))
