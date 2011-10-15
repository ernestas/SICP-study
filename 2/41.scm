;; accumulate / fold-right

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; enumerate (not built in DrRacket)

(define (enumerate-interval a b) ; normal scheme version
  (if (> a b)
      '()
      (cons a (enumerate-interval (+ a 1) b))))

;; helpers

(define nil '())

;; flatmap

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; ordered triples i, j, k <= n
;; i + j + k = s

(define (ordered-triples-sum n s) 
  (filter (lambda (triples)
            (= (accumulate + 0 triples) s)) 
          (unique-triples n)))

(define (unique-triples n)
  (flatmap (lambda (i) 
             (flatmap (lambda (j) 
                        (map (lambda (k) (list i j k)) 
                             (enumerate-interval 1 (- i 2)))) 
                      (enumerate-interval 1 (- i 1)))) 
           (enumerate-interval 1 n)))

;; tests

(unique-triples 3)

(ordered-triples-sum 4 5)
