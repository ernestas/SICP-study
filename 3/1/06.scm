(define (rand command)
  (cond ((eq? command 'generate)
         (random))
        ((eq? command 'reset)
         (λ (new) (random-seed new)))))

;; tests

(rand 'generate)
(rand 'generate)

(newline)

((rand 'reset) 2)
(rand 'generate)
(rand 'generate)
(rand 'generate)