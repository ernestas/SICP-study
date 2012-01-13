;; When serialized-exchange is called, this account is serialized with some
;; other account. When serialized-exchange tries to deposit/withdraw, it
;; won't be able to because deposit/withdraw are serialized using the same
;; serializer as the account itself.