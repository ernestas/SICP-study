; every time "(* ..." is used instead of "(square ...)"
; the expmod has to be calculated twice
; thus transforming from linear recursion O(logN)
; to tree recursion O(2^log.N) = O(N)
; whose execution grows exponentially with the depth of the tree
