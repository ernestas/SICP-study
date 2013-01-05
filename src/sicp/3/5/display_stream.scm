(define (display-line x)
  (newline)
  (display x))

(define (display-stream s number)
  (define (iter index)
    (if (> index number)
        'done
        (begin (display-line (stream-ref s index))
               (iter (+ 1 index)))))
  (newline)
  (iter 0))
