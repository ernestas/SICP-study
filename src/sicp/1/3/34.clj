(ns sicp.1.3.34)

(defn square [x] (* x x))

(defn f [g]
  (g 2))

(f square)
(f #(* % (+ % 1)))

(f f)
