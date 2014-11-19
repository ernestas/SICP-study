# 0 Computer Science

<s>Science</s> Engineering, Art, Magic
<s>Computer</s> Process, Procedure

When some field is just getting started, and you don't really understand it very
well, it is very easy to confuse the esence of what you are doing with the tools
that you use.

We are starting to learn how to formalise intuitions about process.

### Declarative (what) vs imperative (how) knowledge

LISP *procedures* control *processes* which are *imperative* knowledge.

### Techniques for controlling complexity:

This is what the computer science is all about.

Computer science, in some sense, isn't real. It deals with _idealized_
components. We know as much as we want about these little program and data
pieces that we're fitting things together. We don't have to worry about
tolerance. And that means that, in building a large program, there's not all
that much difference between what I can build and what I can imagine, because
the parts are these abstract entities that I know as much as I want.

I know about them as precisely as I'd like. So as opposed to other kinds of
engineering, where the constraints on what you can build are the constraints of
physical systems, the constraints of physics and noise and approximation, the
_constraints imposed in building large software systems are the limitations of
our own minds_.

So in that sense, computer science is like an abstract form of engineering. It's
the kind of engineering where you ignore the constraints that are imposed by
reality.

#### 1. Black box abstraction

* Suppress details (sqrt)
* Express generality (fixed-point)

* Primitive elements
    * Primitive procedures (+ * < =)
    * Primitive data (23 1.738)
* Means of combination
    * Procedure composition (() cond if)
    * Construction of compound data
* Means of abstraction
    * Procedure definition (define)
    * Simple data abstraction
* Capturing common patterns
    * Higher-order procedures
    * Data as procedures

#### 2. Conventional interfaces

* Generic oparators
* Large-scale structures and modularity
* Object-oriented programming
* Operations on aggregates

#### 3. Metalinguistic abstraction

* Interpretation apply-eval
* Example - logic programming
* Register machines
