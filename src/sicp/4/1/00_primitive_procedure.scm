(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))

(define (primitive-implementation proc) (cadr proc))

(define primitive-procedures
  (list (list 'car car)
        (list 'cdr cdr)
        (list 'cons cons)
        (list 'list list)
        (list 'member member)
        (list 'null? null?)
        (list 'not not)
        (list 'equal? equal?)
        (list 'abs abs)
        (list 'xor (lambda (a b) (or (and a (not b))
                                     (and b (not a)))))
        (list '= =)
        (list '< <)
        (list '> >)
        (list '<= <=)
        (list '+ +)
        (list '- -)
        (list '* *)
        (list '/ /)
        ))

(define (primitive-procedure-names)
  (map car
       primitive-procedures))

(define (primitive-procedure-objects)
  (map (lambda (proc) (list 'primitive (cadr proc)))
       primitive-procedures))

(define apply-in-underlying-scheme apply)

(define (apply-primitive-procedure proc args)
  (apply-in-underlying-scheme
   (primitive-implementation proc) args))
