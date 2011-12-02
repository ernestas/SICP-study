(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
	  (if (>= balance amount)
          (begin (set! balance (- balance amount))
		         balance)
          "Insufficient funds"))))

(define W1 (make-withdraw 100))

;;    parameters: initial-amount
;;    body: ((lambda (balance)                                    
;;            (lambda (amount)                                             ___   ___
;;              (if (>= balance amount)                                   /   \ /   \
;;                  (begin (set! balance (- balance amount))      <------|  *  |  *  |-+
;;                         balance)                                       \___/ \___/  |
;;                  "Insufficient funds")))                                    ^       |
;;           initial-amount)                                                   |       |
;;                                                                             |       |
;;                                                                             |       |
;;    global environment                                                       |       V
;;   +-------------------------------------------------------------------------|-------------------+
;;   |                                                                         |                   |
;;   |     W1                                                            make-withdraw             |
;;   |     |                                                                                       |
;;   +-----|---------------------------------------------------------------------------------------+
;;         |                ^
;;         |      E1        |
;;         |     +---------------------+
;;         |     |                     |
;;         |     | initial-amount: 100 |
;;         |     |                     |
;;         |     +---------------------+           
;;         |                ^
;;         |          E2    |
;;         |         +--------------+
;;         |         |              |
;;         |         | balance: 100 |
;;         |         |              |
;;         |         +--------------+           
;;         V                ^
;;     ___   ___            |
;;    /   \ /   \           |
;;   |  *  |  *  |----------+
;;    \___/ \___/ 
;;      |
;;      |
;;      |             parameters: amount
;;      +-------->    body: (if (>= balance amount)
;;                              (begin (set! balance (- balance amount))
;;                                     balance)
;;                              "Insufficient funds")

(W1 50)

;;    parameters: initial-amount
;;    body: ((lambda (balance)                                    
;;            (lambda (amount)                                             ___   ___
;;              (if (>= balance amount)                                   /   \ /   \
;;                  (begin (set! balance (- balance amount))      <------|  *  |  *  |-+
;;                         balance)                                       \___/ \___/  |
;;                  "Insufficient funds")))                                    ^       |
;;           initial-amount)                                                   |       |
;;                                                                             |       |
;;                                                                             |       |
;;    global environment                                                       |       V
;;   +-------------------------------------------------------------------------|-------------------+
;;   |                                                                         |                   |
;;   |     W1                                                            make-withdraw             |
;;   |     |                                                                                       |
;;   +-----|---------------------------------------------------------------------------------------+
;;         |                ^
;;         |      E1        |
;;         |     +---------------------+
;;         |     |                     |
;;         |     | initial-amount: 100 |
;;         |     |                     |
;;         |     +---------------------+           
;;         |                ^
;;         |          E2    |                                   E3
;;         |         +--------------+                          +------------+
;;         |         |              |                          |            |
;;         |         | balance: 100 | <------------------------| amount: 50 |
;;         |         |              |                          |            |
;;         |         +--------------+                          +------------+
;;         V                ^                                      W1 body
;;     ___   ___            |
;;    /   \ /   \           |
;;   |  *  |  *  |----------+
;;    \___/ \___/ 
;;      |
;;      |
;;      |             parameters: amount
;;      +-------->    body: (if (>= balance amount)
;;                              (begin (set! balance (- balance amount))
;;                                     balance)
;;                              "Insufficient funds")

(define W2 (make-withdraw 100))


;;    parameters: initial-amount
;;    body: ((lambda (balance)                                    
;;            (lambda (amount)                                             ___   ___
;;              (if (>= balance amount)                                   /   \ /   \
;;                  (begin (set! balance (- balance amount))      <------|  *  |  *  |-+
;;                         balance)                                       \___/ \___/  |
;;                  "Insufficient funds")))                                    ^       |
;;           initial-amount)                                                   |       |
;;                                                                             |       |
;;                                                                             |       |
;;    global environment                                                       |       V
;;   +-------------------------------------------------------------------------|-------------------+
;;   |                                                                         |                   |
;;   |     W1                                          W2                make-withdraw             |
;;   |     |                                           |                                           |
;;   +-----|-------------------------------------------|-------------------------------------------+
;;         |                ^                          |                ^           
;;         |      E1        |                          |      E1        |
;;         |     +---------------------+               |     +---------------------+
;;         |     |                     |               |     |                     |
;;         |     | initial-amount: 100 |               |     | initial-amount: 100 |
;;         |     |                     |               |     |                     |
;;         |     +---------------------+               |     +---------------------+  
;;         |                ^                          |                ^
;;         |          E2    |                          |          E2    |
;;         |         +-------------+                   |         +--------------+
;;         |         |             |                   |         |              |
;;         |         | balance: 50 |                   |         | balance: 100 |
;;         |         |             |                   |         |              |
;;         |         +-------------+                   |         +--------------+    
;;         V                ^                          V                ^
;;     ___   ___            |                      ___   ___            |
;;    /   \ /   \           |                     /   \ /   \           |
;;   |  *  |  *  |----------+               +----|  *  |  *  |----------+
;;    \___/ \___/                           |     \___/ \___/ 
;;      |                                   V
;;      |
;;      |             parameters: amount
;;      +-------->    body: (if (>= balance amount)
;;                              (begin (set! balance (- balance amount))
;;                                     balance)
;;                              "Insufficient funds")
