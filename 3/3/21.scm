(load "21_queue.scm")

;; tests

(define q1 (make-queue))

(insert-queue! q1 'a)
(insert-queue! q1 'b)
(delete-queue! q1)
(delete-queue! q1)