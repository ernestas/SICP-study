(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
...
(A 0 (A 0 (A 0 (A 0 .... (A 1 1) ... ))))
(A 0 (A 0 (A 0 .... (A 0 2) ... )))
(A 0 (A 0 .... (A 0 4) ... ))
...
; 2^10
1024

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
; since (A 1 x) is 2^x
; (A 1 2) = 2^2 = 4
(A 1 (A 1 4))
(A 1 16)
65536

(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
; from previous (A 2 2) simplifies to 4
(A 2 4)
; which is same as previous excersize
65536

2n

2^n

2^2^... (n times)
