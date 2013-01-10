(ns sicp.test.1.2.28
  (:use clojure.test
        sicp.1.2.28))

(deftest prime-test
  (testing "prime?"
    (is (= (prime? 2) true))
    (is (= (prime? 4) false))
    (is (= (prime? 5) true))
    (is (= (prime? 560) false))
    (is (= (prime? 561) false))
    (is (= (prime? 1105) false))
    (is (= (prime? 1729) false))
    (is (= (prime? 2465) false))
    (is (= (prime? 2821) false))
    (is (= (prime? 6601) false))
    (is (= (prime? 6602) false))))
