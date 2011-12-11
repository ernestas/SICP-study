;; http://en.wikipedia.org/wiki/Doubly_linked_list

(define (make-deque)
  (let ((front-ptr '())
        (rear-ptr '()))
    
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))
    (define (empty-deque?) (null? front-ptr))
    (define (print-deque)
      (define (make-printable-list dq)
        (if (null? dq)
            '()
            (cons (caar dq)
                  (make-printable-list (cdr dq)))))
      (display (make-printable-list front-ptr))
      (newline))
    
    (define (front-insert-deque! item)
      (let ((new-pair (cons (cons item '())
                            '())))
        (cond ((empty-deque?) (set-front-ptr! new-pair)
                              (set-rear-ptr! new-pair)
                              (print-deque))
              (else 
               ; set next pointer of new-pair
               (set-cdr! new-pair front-ptr)
               ; set previous pointer of current front-ptr to point to new-pair
               (set-cdr! (car front-ptr) new-pair)
               (set-front-ptr! new-pair)
               (print-deque)))))
    
    (define (rear-insert-deque! item)
      (let ((new-pair (cons (cons item rear-ptr)
                            '())))
        (cond ((empty-deque?) (set-front-ptr! new-pair)
                              (set-rear-ptr! new-pair)
                              (print-deque))
              (else
               ; set next pointer of current rear-ptr to point to new-pair
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)
               (print-deque)))))
    
    (define (front-delete-deque!)
      (cond ((empty-deque?)
             (error "FRONT-DELETE! called with an empty deque"))
            (else (set-front-ptr! (cdr front-ptr))
                  (print-deque))))
    
    (define (rear-delete-deque!)
      (cond ((empty-deque?)
             (error "REAR-DELETE! called with an empty deque"))
            (else (set-rear-ptr! (cdar rear-ptr))
                  (set-cdr! rear-ptr '())
                  (print-deque))))
    
    (define (dispatch m)
      (cond ((eq? m 'front-insert-deque!) front-insert-deque!)
            ((eq? m 'rear-insert-deque!) rear-insert-deque!)
            ((eq? m 'front-delete-deque!) front-delete-deque!)
            ((eq? m 'rear-delete-deque!) rear-delete-deque!)
            (else (error "Undefined operation -- make-deque" m))))
    dispatch))

;; tests

(define dq (make-deque))

((dq 'front-insert-deque!) 'b)
((dq 'front-insert-deque!) 'a)
((dq 'rear-insert-deque!) 'y)
((dq 'rear-insert-deque!) 'z)

(newline)

((dq 'front-delete-deque!))
((dq 'rear-delete-deque!))