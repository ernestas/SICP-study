(defn make-accumulator [balance]
  #(do (swap! balance + %)
       balance))

(def A (make-accumulator (atom 5)))
(A 10)
(A 5)
