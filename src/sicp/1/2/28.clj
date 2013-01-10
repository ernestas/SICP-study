(ns sicp.1.2.28)

(defn square [x] (* x x))

(defn miller-rabin-expmod [base exp m]
  (defn check [candidate]
    (defn check-nontrivial [candidate square]
      (if (and (not (= candidate 1))
               (not (= candidate (- m 1)))
               (= square 1))
        0
        square))
    (check-nontrivial candidate (rem (square candidate) m)))
  (cond (= exp 0) 1
        (even? exp) (check (miller-rabin-expmod base (/ exp 2) m))
        :else (rem (* base (miller-rabin-expmod base (- exp 1) m))
                         m)))

(defn miller-rabin-test [n]
  (defn try-it [a]
    (defn check-it [x]
      (and (not (= x 0)) (= x 1)))
    (check-it (miller-rabin-expmod a (- n 1) n)))
  (try-it (+ 1 (rand-int (- n 1)))))

(defn fast-prime? [n times]
  (cond (= times 0) true
        (miller-rabin-test n) (fast-prime? n (- times 1))
        :else false))

(defn prime? [n]
  (fast-prime? n 1000))
