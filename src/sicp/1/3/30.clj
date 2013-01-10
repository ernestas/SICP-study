(ns sicp.1.3.30)

(defn sum [term a next b]
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(defn sum-iter [term a next b]
  (defn iter [a result]
    (if (> a b)
      result
      (recur (next a) (+ result (term a)))))
  (iter a 0))

(defn sum-integers [a b]
  (sum identity a inc b))

(defn sum-integers-iter [a b]
  (sum-iter identity a inc b))

(sum-integers 1 10)
(sum-integers-iter 1 10)
