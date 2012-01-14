;; accumulate

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; accumulate-n

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op
                        init
                        (map (lambda (x) (car x)) seqs))
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x)) seqs)))))

;; helpers

(define nil '())

;; test

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
(accumulate-n + 0 s)
(accumulate-n * 1 s)
