(defn make-monitored [f]
  (def counter (atom 0))
  (fn [input]
    (cond (= input 'how-many-calls?) counter
          (= input 'reset-counter) (reset! counter 0)
          :else (do (swap! counter inc)
                    (f input)))))

(def s (make-monitored inc))
(s 100)
(s 'how-many-calls?)

(s 'reset-counter)
(s 'how-many-calls?)
