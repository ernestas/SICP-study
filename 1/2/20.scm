(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(gcd 206 40)
(gcd 40 (remainder 206 40))
;---
(if (= (remainder 206 40) 0) ; 1
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))
;---
(if (= (remainder 40 (remainder 206 40)) 0) ; 2
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;---
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 4
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;---
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)) ; 7
;^^ which is true
; a gets evaluated:
(remainder (remainder 206 40)
           (remainder 40
                      (remainder 206 40))) ; 4
; 1 + 2 + 4 + 7 + 4 = 18 calls to remainder in normal-order evaluation

(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remaider 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
; 1 + 1 + 1 + 1 = 4 calls to remainder in applicative order evaluation
