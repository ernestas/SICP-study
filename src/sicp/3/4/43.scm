;; a

;; Argue that if the processes are run sequentially, after any number of
;; concurrent exchanges, the account balances should be $10, $20, and $30
;; in some order.

;; Since processes are run sequentially, an exchange of any two account balances
;; will leave the same account balances but in different order/accounts. Since
;; only the order of account ballances changes, it can do any number of
;; concurrent exchanges for the account balances to be $10, $20 and $30 in some
;; order.


;; b

;; Draw a timing diagram like the one in figure 3.29 to show how this condition
;; can be violated if the exchanges are implemented using the first version of
;; the account-exchange program in this section.

;; Peter (exchange a1 a2)
;; Paul  (exchange a1 a3)
;; From the book:
;; For example, Peter might compute the difference in the balances for a1 and
;; a2, but then Paul might change the balance in a1 before Peter is able to
;; complete the exchange.


;; c

;; On the other hand, argue that even with this exchange program, the sum of the
;; balances in the accounts will be preserved.

;; Since the transactions are serialized, the sum of the balances in the
;; accounts will be preserved.


;; d

;; Draw a timing diagram to show how even this condition would be violated if we
;; did not serialize the transactions on individual accounts.

;; withdraw and deposit procedures will mess each other up.
