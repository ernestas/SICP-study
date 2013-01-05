(define (make-account balance acc-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define bad-pass 0)

  (define (bad-password amount)
    (begin (set! bad-pass (+ bad-pass 1))
           (if (> bad-pass 7)
               call-the-cops
               (print "Incorrect password"))))

  (define call-the-cops "Five-o is on the way")

  (define (dispatch password m)
    (if (eq? password acc-password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))
        bad-password))
  dispatch)

;; tests

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50) (newline)
((acc 'some-other-password 'deposit) 50)
