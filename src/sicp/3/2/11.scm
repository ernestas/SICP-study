(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)



(define acc (make-account 50))

;;      +-------->     parameters: balance
;;     _|_   ___       body: (define (withdraw amount) ...)
;;    /   \ /   \            (define (deposit amount) ...)
;;   |  *  |  *  |-+         (define (dispatch m) ...)
;;    \___/ \___/  |         dispatch
;;         ^       |
;;         |       V                                         global environment
;;   +-----|-------------------------------------------------------------------+
;;   |     |                                                                   |
;;   | make-account      acc                                                   |
;;   |                    |                                                    |
;;   +--------------------|----------------------------------------------------+
;;                        |   ^
;;         +--------------+   |   +---------+----+----+
;;         |                  |   |         |    |    |
;;         |            E1    |   V         |    |    |
;;         V           +-------------+      |    |    |
;;     ___   ___       | balance: 50 |      |    |    |
;;    /   \ /   \      | withdraw----+---> **    |    |
;;   |  *  |  *  |---> | deposit-----+--------> **    |
;;    \___/ \___/      | dispatch----+-------------> **
;;      |              +-------------+
;;      |
;;      |
;;      |
;;      V
;;    parameters: m
;;    body: (cond ((eq? m 'withdraw) withdraw)
;;                ((eq? m 'deposit) deposit)
;;                (else (error "Unknown request - MAKE-ACCOUNT"
;;                             m))))

((acc 'deposit) 40)

;;      +-------->     parameters: balance
;;     _|_   ___       body: (define (withdraw amount) ...)
;;    /   \ /   \            (define (deposit amount) ...)
;;   |  *  |  *  |-+         (define (dispatch m) ...)
;;    \___/ \___/  |         dispatch
;;         ^       |
;;         |       V                                         global environment
;;   +-----|-------------------------------------------------------------------+
;;   |     |                                                                   |
;;   | make-account      acc                                                   |
;;   |                    |                                                    |
;;   +--------------------|----------------------------------------------------+
;;                        |   ^
;;         +--------------+   |
;;         |                  |               E2
;;         |            E1    |              +-------------+
;;         V           +-------------+  <----| m: 'deposit | dispatch body
;;     ___   ___       | balance: 90 |       +-------------+
;;    /   \ /   \      | withdraw    |
;;   |  *  |  *  |---> | deposit     |        E3
;;    \___/ \___/      | dispatch    |       +------------+
;;      |              +-------------+  <----| amount: 40 | deposit body
;;      |                                    +------------+
;;      |
;;      |
;;      V
;;
;;    parameters: m
;;    body: (cond ((eq? m 'withdraw) withdraw)
;;                ((eq? m 'deposit) deposit)
;;                (else (error "Unknown request - MAKE-ACCOUNT"
;;                             m))))

((acc 'withdraw) 60) ;; like deposit ^^

(define acc2 (make-account 100))

;;      +-------->     parameters: balance
;;     _|_   ___       body: (define (withdraw amount) ...)
;;    /   \ /   \            (define (deposit amount) ...)
;;   |  *  |  *  |-+         (define (dispatch m) ...)
;;    \___/ \___/  |         dispatch
;;         ^       |
;;         |       V                                         global environment
;;   +-----|-------------------------------------------------------------------+
;;   |     |                                                                   |
;;   | make-account      acc                       acc2                        |
;;   |                    |                         |                          |
;;   +--------------------|-------------------------|--------------------------+
;;                        |   ^                     |                  ^
;;         +--------------+   |                     |                  |
;;         |                  |                     |                  |
;;         |            E1    |                     |            E2    |
;;         V           +-------------+              V           +--------------+
;;     ___   ___       | balance: 30 |          ___   ___       | balance: 100 |
;;    /   \ /   \      | withdraw    |         /   \ /   \      | withdraw     |
;;   |  *  |  *  |---> | deposit     |        |  *  |  *  |---> | deposit      |
;;    \___/ \___/      | dispatch    |         \___/ \___/      | dispatch     |
;;      |              +-------------+           |              +--------------+
;;      |                                        |
;;      |                                        |
;;      |                                        |
;;      V                                        |
;;    parameters: m                              V
;;    body: (cond ((eq? m 'withdraw) withdraw)
;;                ((eq? m 'deposit) deposit)
;;                (else (error "Unknown request - MAKE-ACCOUNT"
;;                             m))))
