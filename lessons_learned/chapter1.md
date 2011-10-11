## Section 1.1

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
	* `(define square (lombda (x) (* x x)))` is the same as
	* `(define (square x) (* x x))`

### Applicative order vs normal order evaluation:

* Applicative order
	* evaluate the arguments and then apply
	* used in LISP
* Normal order
	* fully expand and then reduce


## Section 1.2

### Recursive vs Iterative *Processes*


## Section 1.3

### Higher order procedures (procedures have first-class status):

* Procedures named by variables
* Procedures as arguments
* Procedures as returned values
