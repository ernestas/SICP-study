(define (first-frame env) (car env))
(define (make-frame variables values)
  (map cons variables values))
(define (frame-variables frame) (map car frame))
(define (frame-values frame) (map cdr frame))
(define (find-record-in-frame var frame)
  (assoc var frame))

(define (add-binding-to-frame! var val frame)
  (let ((cdr-frame (cons (car frame) (cdr frame))))
    (set-car! frame (cons var val))
    (set-cdr! frame cdr-frame)))

(define (find-record-in-env var env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        false
        (let ((record (find-record-in-frame var (first-frame env))))
          (if record
              record
              (env-loop (enclosing-environment env))))))
  (env-loop env))

(define get-record-value cdr)
(define set-record-value! set-cdr!)

(define the-empty-environment '())
(define (enclosing-environment env) (cdr env))
(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))

(define (lookup-variable-value var env)
  (let ((record (find-record-in-env var env)))
    (if record
        (get-record-value record)
        (error "Unbound variable" var))))

(define (set-variable-value! var val env)
  (let ((record (find-record-in-env var env)))
    (if record
        (set-record-value! record val)
        (error "Unbound variable -- SET!" var))))

(define (define-variable! var val env)
  (let ((record (find-record-in-frame var (first-frame env))))
    (if record
        (set-record-value! record val)
        (add-binding-to-frame! var val (first-frame env)))))

(define (setup-environment)
  (let ((initial-env
         (extend-environment (primitive-procedure-names)
                             (primitive-procedure-objects)
                             the-empty-environment)))
    (define-variable! 'true true initial-env)
    (define-variable! 'false false initial-env)
    initial-env))

;[do later] (define the-global-environment (setup-environment))
