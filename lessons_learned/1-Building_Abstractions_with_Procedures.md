# 1 Building Abstractions with Procedures

## 1.1 The Elements of Programming

The means that the language provides for combining simple ideas to form more
complex ideas:

* *primitive expressions*, which represent the simplest entities the language is
  concerned with `+ * < =`,
* *means of combination*, by which compound elements are built from simpler
  ones `() cond if`, and
* *means of abstraction*, by which compound elements can be named and
  manipulated as units `(define square (λ (x) (* x x)))`.

````` scheme
(define square (λ (x) (* x x)))
;; is the same as
(define (square x) (* x x))
`````

### Applicative order vs normal order evaluation:

* Applicative order
	* evaluate the arguments and then apply
	* used in LISP
* Normal order
	* fully expand and then reduce


## 1.2 Procedures and the Processes They Generate

The key to understanding complicated things is to know what _not_ to look at
and what _not_ compute and what _not_ to think.

*Processes* can be Recursive or Iterative

Seheme is _tail-recursive_. It will execute an iterative process in constant
space, even if the iterative process is described by a recursive procedure. With
a _tail-recursive_ implementation, iteration can be expressed using the ordinary
procedure call mechanism, so that special iteration constructs are useful only
as syntactic sugar.


## 1.3 Formulating Abstractions with Higher-Order Procedures

Higher order procedures have first-class status.

### The rights and privileges of first-class citizens

* To be named by variables.
* To be passed as arguments.
* To be returned as values of procedures.
* To be incorporated into data structures.
