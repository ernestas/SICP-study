;; constructors

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;; b

(define (is-mobile? structure)
  (pair? structure))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (is-mobile? structure)
        (mobile-weight structure)
        structure)))

(define (mobile-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (total-weight mobile)
  (mobile-weight mobile))

;; c

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (is-branch-balanced? branch)
  (let ((structure (branch-structure branch)))
    (if (is-mobile? structure)
        (is-mobile-balanced? structure)
        true)))

(define (is-mobile-balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (torque left)
            (torque right))
         (is-branch-balanced? left)
         (is-branch-balanced? right))))

;; d

; (define (make-mobile left right)
;   (cons left right))
; (define (make-branch length structure)
;   (cons length structure))

; changing constructors to above ^^
; the accessors from part 'a' will have to be changed
