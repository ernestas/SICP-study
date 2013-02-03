(define (letrec-bindings exp)
  (cadr exp))
(define (letrec-body exp)
  (cddr exp))

(define binding-var car)
(define binding-val cadr)

(define (declare-variables exp)
  (map (lambda (binding)
         (list (binding-var binding)
               ''*unassigned*))
       (letrec-bindings exp)))

(define (set!-variables exp)
  (map (lambda (binding)
         (list 'set!
               (binding-var binding)
               (binding-val binding)))
       (letrec-bindings exp)))

(define (letrec->let exp)
  (append (list 'let
                (declare-variables exp))
          (set!-variables exp)
          (letrec-body exp)))

(put 'letrec
     (lambda (exp env)
       (eval* (letrec->let exp) env)))
