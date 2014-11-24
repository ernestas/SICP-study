# 2 Building Abstractions with Data

## 2.1 Introduction to Data Abstraction

### Data abstraction

Data abstraction is a methodology that enables us to isolate how a *compound
data object* is **used** from the details of how it is **constructed** from more
primitive data objects. The interface between these two parts of our system will
be a set of procedures, called *selectors* and *constructors*.

### Procedural representation of pairs

This style of programming is often called _message passing_:

````` scheme
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))
`````
Church numerals - Alonzo Church.


## 2.2 Hierarchical Data and the Closure Property

### Closure property

An *operation for combining data objects* satisfies the *closure property* if
the results of combining things with that *operation* can themselves be combined
using the same *operation*.

A *set of elements* is said to be *closed under an operation* if applying the
*operation* to elements in the set produces an element that is again an element
of the set.

### Sequences as *conventional interfaces*

One procedure's output is another's input. Similarly to signal flow in
signal-processing, sequence flows through procedures.

### Nested mappings

The sequence paradigm is extended to include many computations that are commonly
expressed using nested loops.

````` scheme
(flatmap
 (lambda (i)
   (map (lambda (j) (list i j))
        (enumerate-interval 1 (- i 1))))
 (enumerate-interval 1 n))
`````

### *Metalinguistic abstraction* - a picture language

_Stratified design_ is the notion that a complex system should be structured as
a sequence of levels that are described using a sequence of _languages_. Each
level is constructed by combining parts that are regarded as primitive at that
level, and the parts constructed at each level are used as primitives at the
next level. The language used at each level of a stratified design has
primitives, means of combination, and means of abstraction appropriate to that
level of detail.

_Stratified design_ helps make programs _robust_, that is, it makes it likely
that small changes in a specification will require correspondingly small changes
in the program.


## 2.3 Symbolic Data

### Quotation

Allowing quotation in a language wreaks havoc with the ability to reason about
the language in simple terms, because it destroys the notion that equals can be
substituted for equals.

Quotation is powerful because it gives us a way to build expressions that
manipulate other expressions. But allowing statements in a language that talk
about other statements in that language makes it very difficult to maintain any
coherent principle of what “equals can be substituted for equals” should mean.

### Representing sets as:

* unordered lists
* ordered lists
* binary trees

### Huffman encoding trees

*Huffman coding* is an *entropy encoding* algorithm.

*Entropy encoding* is a lossless data compression scheme that is independent of
the specific characteristics of the medium. It creates and assigns a
*unique prefix-free* code to each unique symbol that occurs in the input.


## 2.4 Multiple Representation for Abstract Data

*Dispatch on type* is a general strategy of checking the type of a datum and
calling an appropriate procedure.

*Data-directed programming* is a "dispatch" technique on procedures for
integrating (additively) separately developed data-type modules, based on the
programmers manual setup of dynamic tables for procedure access. In
modern object-oriented programming languages it is implemented as polymorphism.

*Message passing* - intelligent data objects (procedures) that dispatch on
operation names.

Which dispatch to use when: [2/4/76.scm](https://github.com/ernestas/SICP-study/blob/master/src/sicp/2/4/76.scm)

## 2.5 Systems with Generic Operations

*Generic Operations* are operations that use data-directed techniques and are
generic over different kinds of arguments.

*Coercion* makes objects of one type may be viewed as being of another type.
