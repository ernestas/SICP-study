(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 6)

;;    global environment
;;   +---------------------------------------------------------------------------------------------+
;;   |                                                                                             |
;;   |  factorial                                                                                  |
;;   |     |                                                                                       |
;;   +-----|---------------------------------------------------------------------------------------+
;;         |       ^          ^            ^            ^            ^            ^            ^
;;         |       |          |            |            |            |            |            |
;;         V       |          |            |            |            |            |            |
;;     ___   ___   |       E1 |         E2 |         E3 |         E4 |         E5 |         E6 |
;;    /   \ /   \  |      +------+     +------+     +------+     +------+     +------+     +------+
;;   |  *  |  *  |-+      |      |     |      |     |      |     |      |     |      |     |      |
;;    \___/ \___/         | n: 6 |     | n: 5 |     | n: 4 |     | n: 3 |     | n: 2 |     | n: 1 |
;;      |                 |      |     |      |     |      |     |      |     |      |     |      |
;;      |                 +------+     +------+     +------+     +------+     +------+     +------+
;;      V                 factorial    factorial    factorial    factorial    factorial    factorial
;;   parameters: n          body         body         body         body         body         body
;;   body: (if (= n 1)
;;             1
;;             (* n (factorial (- n 1))))


(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
	  (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
(factorial 3)

;;    parameters: n                              parameters: product counter max-count
;;    body: (fact-iter 1 1 n)                    body: (if (> counter max-count)
;;                                                         product
;;      ^                                                  (fact-iter (* counter product)
;;      |                                                              (+ counter 1)
;;      |                                                       ^      max-count))
;;      |                                                       |
;;      |                                                       |
;;      |                                                       |
;;     ___   ___                                               ___   ___
;;    /   \ /   \                                             /   \ /   \
;;   |  *  |  *  |-+                                         |  *  |  *  |-+
;;    \___/ \___/  |                                          \___/ \___/  |
;;         ^       |                                               ^       |
;;         |       V                                               |       V     global environment
;;   +-----|-------------------------------------------------------|-------------------------------+
;;   |     |                                                       |                               |
;;   |  factorial                                              fact-iter                           |
;;   |                                                                                             |
;;   +---------------------------------------------------------------------------------------------+
;;       ^                  ^                    ^                    ^                    ^
;;       |            E2    |              E3    |              E4    |              E5    |
;;    E1 |           +--------------+     +--------------+     +--------------+     +--------------+
;;   +------+        |              |     |              |     |              |     |              |
;;   |      |        | product: 1   |     | product: 1   |     | product: 2   |     | product: 6   |
;;   | n: 3 |        | counter: 1   |     | counter: 2   |     | counter: 3   |     | counter: 4   |
;;   |      |        | max-count: 3 |     | max-count: 3 |     | max-count: 3 |     | max-count: 3 |
;;   +------+        |              |     |              |     |              |     |              |
;;   factorial       +--------------+     +--------------+     +--------------+     +--------------+
;;     body           fact-iter body       fact-iter body       fact-iter body       fact-iter body
