# Chapter 2

## Section 2.1

### Data abstraction

Data abstraction is a methodology that enables us to isolate how a *compound data object* is **used** from the details of how it is **constructed** from more primitive data objects. The interface between these two parts of our system will be a set of procedures, called *selectors* and *constructors*.

A procedural representation of pairs - message passing.

Church numerals - Alonzo Church.


## Section 2.2

### Closure property

An *operation for combining data objects* satisfies the *closure property* if the results of combining things with that *operation* can themselves be combined using the same *operation*.

A *set of elements* is said to be *closed under an operation* if applying the *operation* to elements in the set produces an element that is again an element of the set. 

### Sequences as *conventional interfaces*

One procedure's output is another's input. Similarly to signal flow in signal-processing, sequence flows through procedures.

### Nested mappings

The sequence paradigm is extended to include many computations that are commonly expressed using nested loops.

### *Metalinguistic abstraction* - a picture language


## Section 2.3

### Representing sets as:

* unordered lists
* ordered lists
* binary trees

### Huffman encoding trees

*Huffman coding* is an *entropy encoding* algorithm.

*Entropy encoding* is a lossless data compression scheme that is independent of the specific characteristics of the medium. It creates and assigns a *unique prefix-free* code to each unique symbol that occurs in the input.


## Section 2.4

*Dispatch on type* is a general strategy of checking the type of a datum and calling an appropriate procedure.

*Data-directed programming* is a "dispatch" technique on procedures for integrating (additively) separately developed data-type modules, based on the programmers manual setup of dynamic tables for procedure access. In modern object-oriented programming languages it is implemented as polymorphism.

*Message passing* - intelligent data objects (procedures) that dispatch on operation names.

Which dispatch to use when: [2/76.scm](https://github.com/ernestas/SICP-study/blob/master/2/76.scm)
