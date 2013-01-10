(defn f-recursive [n]
  (if (< n 3)
    n
    (+ (f-recursive (- n 1))
       (* 2 (f-recursive (- n 2)))
       (* 3 (f-recursive (- n 3))))))

(defn f-iter [a b c count]
  (if (< count 3)
    c
    (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

(defn f-iterative [n]
  (if (< n 3)
    n
    (f-iter 0 1 2 n)))
