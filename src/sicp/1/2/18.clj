(defn halve [n]
  (/ n 2))

(defn multiply [a b]
  (defn mult-iter [a b n]
    (cond (= b 0) n
          (even? b) (mult-iter (double a) (halve b) n)
          :else (mult-iter a (- b 1) (+ n a))))
  (mult-iter a b 0))
