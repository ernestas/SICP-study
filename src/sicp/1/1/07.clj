(defn average [x y]
  (/ (+ x y) 2))

(defn improve [guess x]
  (average guess (/ x guess)))

(defn good-enough? [ratio]
  (and (< ratio 1.001) (> ratio 0.999)))

(defn sqrt-iter [guess x]
  (if (good-enough? (/ guess (improve guess x)))
    guess
    (sqrt-iter (improve guess x)
               x)))

(defn sqrt-1-7 [x]
  (sqrt-iter 1.0 x))
