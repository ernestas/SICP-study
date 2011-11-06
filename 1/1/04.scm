; if returns either + or - depending on its predicate
; which then is applied as a function to variables a and b
(define (a-plus-abs-b a b)
  ((if (> b 0)
       +
       -) a b))