(defn pascal [row col]
  (cond (= col 1) 1
        (= col row) 1
        :else (+ (pascal (- row 1) col)
                 (pascal (- row 1) (- col 1)))))
