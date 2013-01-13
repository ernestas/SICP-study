(define (same-parity x . items)
  (define (even-or-odd items items-selected even-odd?)
    (if (null? items)
        items-selected
        (if (even-odd? (car items))
            (even-or-odd (cdr items)
                         (cons (car items) items-selected) even-odd?)
            (even-or-odd (cdr items) items-selected even-odd?))))
  (if (odd? x)
      (cons x (reverse (even-or-odd items () odd?)))
      (cons x (reverse (even-or-odd items () even?)))))

;; tests

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
