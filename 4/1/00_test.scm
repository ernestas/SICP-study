;; Tests from:
;; http://eli.thegreenplace.net/wp-content/uploads/2007/12/06/evaluator_testing.lisp

(define-test (self-eval)
  (assert-equal 5 (interpret 5))
  (assert-equal "hey" (interpret "hey"))
  (assert-equal 666666666222 (interpret 666666666222) 666666666222))

(define-test (test-exprs )
  (assert-equal 3 (interpret '(+ 1 2)))
  (assert-equal 2 (interpret '(* (- 2 3) (- 4 6))))
  (assert-equal 11 (interpret '(+ (* 1 2) (/ 6 2) (* (- 5 4) 2 3)))))

(define-test (test-quoted)
  (assert-eq 2 (interpret '(quote 2)))
  (assert-eq 'hello (interpret '(quote hello)) 'hello)
  (assert-equal '(jay wizz 2 watt) (interpret '(quote (jay wizz 2 watt)))))

(define-test (test-conditionals)
  (assert-true (interpret '(if (= 4 5) false 1)))
  (assert-true (interpret '(if (= 5 5) 1 false)))
  (assert-true (interpret '(if false false true)))
  (assert-true (interpret '(if 1 true false)))

  ; note: -cond- also tests how -begin- works
  (assert-true (interpret '(cond (false false) (else true))))
  (assert-true (interpret '(cond (true true) (else false))))
  (assert-true
    (interpret
      '(cond
        ((= 5 6) false)
        ((= 4 5) false)
        ((= 5 5) true)
        (else false))))
  (assert-true
    (interpret
      '(cond
        ((= 5 6) false)
        ((= 4 5) false)
        ((= 51 5) false)
        (else (= 1 1))))))

(define-test (test-vars)
  (interpret '(define joe 12))

  (assert-true (= (interpret 'joe) 12))
  (assert-true (= (interpret '(+ joe 2)) 14))
  (assert-true (interpret '(= joe 12)))

  (interpret '(define dave 5))
  (assert-true (= (interpret '(+ joe dave)) 17))
  (assert-true (not (interpret '(= joe dave))))

  (interpret '(set! dave 10))
  (interpret '(set! joe (+ 10 dave)))
  (assert-true (= (interpret '(+ joe dave)) 30)))

(define-test (test-functions)
  ; simple function definition and application
  (interpret
   '(define (sum a b)
      (+ a b)))
  (interpret
   '(define (average x y)
      (/ (sum x y) 2)))

  (interpret '(define xx 10))
  (interpret '(define yy 20))
  (assert-equal 6 (interpret '(sum 2 4)))
  (assert-equal 15 (interpret '(average xx yy)))


  ; applying a lambda directly
  (assert-equal 20
                (interpret
                 '((lambda (x y) (+ x y)) 15 5)))

  ; define an explicit lambda
  (interpret
   '(define lsum
      (lambda (x y) (+ x y))))
  (assert-equal 23 (interpret '(lsum 11 12)))
  (interpret
   '(set! lsum
          (lambda (x y) (- x y))))
  (assert-equal -1 (interpret '(lsum 11 12)))

  ; recursive function
  (interpret
   '(define (rsum x y)
      (if (= y 0)
          x
          (rsum (+ x 1) (- y 1)))))
  (assert-equal 11 (interpret '(rsum 5 6)))
  (assert-equal 6 (interpret '(rsum 0 6)))
  (assert-equal 6 (interpret '(rsum 6 0)))

  ; returning a function from another function
  (interpret
   '(define (make-adder-func x)
      (lambda (y) (+ x y))))
  (interpret
   '(define add2 (make-adder-func 2)))
  (assert-equal 12 (interpret '(add2 xx)))
  (assert-equal 14 (interpret '((make-adder-func 4) 10)))

  ; accepting a function as an argument
  (interpret
   '(define (apply-twice func val)
      (func (func val))))
  (assert-equal 104 (interpret '(apply-twice add2 100)))
  (assert-equal 10000
                (interpret
                 '(apply-twice (lambda (x) (* x x)) 10)))

  ; complex high-order wizardry. -compose- takes two
  ; functions, and returns a function that is their
  ; composition
  ;
  (interpret
   '(define (compose f g) (lambda (x) (f (g x)))))
  (interpret '(define (square x) (* x x)))
  (interpret '(define (inc x) (+ x 1)))
  (assert-equal 121 (interpret '((compose square inc) 10)))
  (assert-equal 101 (interpret '((compose inc square) 10))))
