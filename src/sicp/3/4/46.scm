(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))

;; From the book:
;; We must guarantee that, once a process has tested the cell and found it to be
;; false, the cell contents will actually be set to true before any other
;; process can test the cell. If we do not make this guarantee, then the mutex
;; can fail in a way similar to the bank-account
