;; A deadlock is a situation wherein two or more competing actions are each
;; waiting for the other to finish, and thus neither ever does. If all actions
;; were to attempt to enter a procedure protecting the lowest-number account
;; first, the deadlock would not occur. This is because for an action to protect
;; the second account the first account will have to be protected first, and if
;; the first account is already protected by some other action then the second
;; account will not be secured untill the first account can be secured.

;; exchange
(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

;; serialized exchange
(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    (if (< (account1 'id) (account2 'id))
        ((serializer2 (serializer1 exchange))
         account2 account1)
        ((serializer1 (serializer2 exchange))
         account1 account2))))

;; make-account
(define (make-account id balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance) "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dospatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'id) id)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))

;; deposit
(define (deposit account amount)
  (let ((s (account 'serializer))
        (d (account 'deposit)))
    ((s d) amount)))
