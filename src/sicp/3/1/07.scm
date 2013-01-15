;; from 3.03

(define (make-account balance acc-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (bad-password amount)
    (print "Incorrect password"))
  (define (dispatch password m)
    (if (eq? password acc-password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))
        bad-password))
  dispatch)

;; make-joint

(define (make-joint account acc-password new-password)
  (lambda (password m)
    (if (eq? password new-password)
        (account acc-password m)
        (error "Bad password -- MAKE-JOINT" new-password))))

;; tests

(define peter-acc
  (make-account 100 'bazinga))
(define paul-acc
  (make-joint peter-acc 'bazinga 'rosebud))

((peter-acc 'bazinga 'withdraw) 10)
((paul-acc 'rosebud 'withdraw) 10)
((peter-acc 'bazinga 'deposit) 20)
((paul-acc 'rosebud 'deposit) 20)
