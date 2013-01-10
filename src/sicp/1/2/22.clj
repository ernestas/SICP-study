(ns sicp.1.2.22
  (:use sicp.1.2.21))

(defn prime? [n]
  (= n (smallest-divisor n)))

(defn report-prime [n elapsed-time]
  (newline)
  (print n)
  (print " *** ")
  (print elapsed-time))

(defn start-prime-test [n start-time]
  (if (prime? n)
    (report-prime n (- (System/currentTimeMillis) start-time))))

(defn timed-prime-test [n]
  (start-prime-test n (System/currentTimeMillis)))

(defn search-for-primes [start end]
  (if (<= start end)
    (cond (even? start) (search-for-primes (+ start 1) end)
          :else (do (timed-prime-test start)
                    (search-for-primes (+ start 2) end)))
    (newline)))

(search-for-primes 1000 1019)
(search-for-primes 10000 10037)
(search-for-primes 100000 100043)
(search-for-primes 1000000 1000037)
