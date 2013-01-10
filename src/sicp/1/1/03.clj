(defn square [x]
  (* x x))

(defn sum-of-squares [a b]
  (+ (square a) (square b)))

(defn max-of-two [a b]
  (if (< a b)
    b
    a))

(defn min-of-two [a b]
  (if (< a b)
    a
    b))

(defn sum-of-two-biggest-squares [a b c]
  (sum-of-squares (max-of-two a b)
                  (max-of-two c (min-of-two a b))))

;; test

(sum-of-two-biggest-squares 1 2 3)
