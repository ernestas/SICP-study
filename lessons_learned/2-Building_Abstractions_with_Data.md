<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [2 Building Abstractions with Data](#2-building-abstractions-with-data)
    - [2.1 Introduction to Data Abstraction](#21-introduction-to-data-abstraction)
        - [Data abstraction](#data-abstraction)
        - [Procedural representation of pairs](#procedural-representation-of-pairs)
    - [2.2 Hierarchical Data and the Closure Property](#22-hierarchical-data-and-the-closure-property)
        - [Closure property](#closure-property)
        - [Sequences as *conventional interfaces*](#sequences-as-conventional-interfaces)
        - [Nested mappings](#nested-mappings)
        - [*Metalinguistic abstraction* - a picture language](#metalinguistic-abstraction---a-picture-language)
    - [2.3 Symbolic Data](#23-symbolic-data)
        - [Quotation](#quotation)
        - [Representing sets as:](#representing-sets-as)
        - [Huffman encoding trees](#huffman-encoding-trees)
    - [2.4 Multiple Representation for Abstract Data](#24-multiple-representation-for-abstract-data)
    - [2.5 Systems with Generic Operations](#25-systems-with-generic-operations)

<!-- markdown-toc end -->
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

Data-abstraction barriers are powerful tools for controlling complexity. By
isolating the underlying representations of data objects, we can divide the task
of designing a large program into smaller tasks that can be performed
separately. But this kind of data abstraction is not yet powerful enough,
because it may not always make sense to speak of “the underlying representation”
for a data object.

So in addition to the data-abstraction barriers that isolate representation from
use, we need abstraction barriers that isolate different design choices from
each other and permit different choices to coexist in a single program.
Furthermore, since large programs are often created by combining pre-existing
modules that were designed in isolation, we need conventions that permit
programmers to incorporate modules into larger systems additively, that is,
without having to redesign or reimplement these modules.

*Dispatch on type* is a general strategy of checking the type of a datum and
calling an appropriate procedure. This strategy is _not additive_.

*Data-directed programming* is a "dispatch" technique on procedures for
integrating (additively) separately developed data-type modules, based on the
programmers manual setup of dynamic tables for procedure access. In modern
object-oriented programming languages it is implemented as _polymorphism_.

*Message passing* - intelligent data objects (procedures) that dispatch on
operation names.

Which dispatch to use when: [2/4/76.scm](https://github.com/ernestas/SICP-study/blob/master/src/sicp/2/4/76.scm)

## 2.5 Systems with Generic Operations

*Generic Operations* are operations that use data-directed techniques and are
generic over different kinds of arguments.

*Coercion* makes objects of one type may be viewed as being of another type.
