(define (prepare-argument exp param env)
  (begin
    (cond ((lazy? param)
           (list 'thunk (car exp) env))
          ((lazy-memo? param)
           (list 'thunk-memo (car exp) env))
          (else (eval* exp env)))))

(define (lazy? param)
  (and (pair? param)
       (eq? (cadr param) 'lazy)))

(define (lazy-memo? param)
  (and (pair? param)
       (eq? (cadr param) 'lazy-memo)))

(define (thunk? obj)
  (tagged-list? obj 'thunk))
(define (thunk-memo? obj) ; new
  (tagged-list? obj 'thunk-memo))

(define (thunk-exp thunk) (cadr thunk))
(define (thunk-env thunk) (caddr thunk))

(define (evaluated-thunk? obj)
  (tagged-list? obj 'evaluated-thunk))
(define (thunk-value evaluated-thunk)
  (cadr evaluated-thunk))

(define (force-it obj)
  (cond ((thunk-memo? obj) ; new
         (let ((result (actual-value (thunk-exp obj)
                                     (thunk-env obj))))
           (set-car! obj 'evaluated-thunk)
           (set-car! (cdr obj)
                     result) ;replace exp with its value
           (set-cdr! (cdr obj)
                     '()) ;forget unneeded env
           result))
        ((thunk? obj) ; new
         (actual-value (thunk-exp obj) (thunk-env obj)))
        ((evaluated-thunk? obj) (thunk-value obj))
        (else obj)))
