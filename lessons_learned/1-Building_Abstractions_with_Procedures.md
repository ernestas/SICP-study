# 1 Building Abstractions with Procedures

## 1.1 The Elements of Programming

### Declarative (what) vs imperative (how) knowledge

LISP *procedures* control *processes* which are *imperative* knowledge.

### Techniques for controlling complexity:

* Black box abstraction
* Conventional interfaces
* Metalinguistic abstraction

### The elements of programming

The means that the language provides for combining simple ideas to form more complex ideas:

* *primitive expressions*, which represent the simplest entities the language is concerned with,
* *means of combination*, by which compound elements are built from simpler ones, and
* *means of abstraction*, by which compound elements can be named and manipulated as units.

````` scheme
(define square (lombda (x) (* x x)))
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

### Recursive vs Iterative *Processes*


## 1.3 Formulating Abstractions with Higher-Order Procedures

### Higher order procedures (procedures have first-class status):

* Procedures named by variables
* Procedures as arguments
* Procedures as returned values
