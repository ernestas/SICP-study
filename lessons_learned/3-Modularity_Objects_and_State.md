<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [3 Modularity, Objects and State](#3-modularity-objects-and-state)
    - [3.1 Assignment and Local State](#31-assignment-and-local-state)
    - [3.2 The Environment Model of Evaluation](#32-the-environment-model-of-evaluation)
    - [3.3 Modeling with Mutable Data](#33-modeling-with-mutable-data)
    - [3.4 Concurrency: Time Is of the Essence](#34-concurrency-time-is-of-the-essence)
    - [3.5 Streams](#35-streams)

<!-- markdown-toc end -->
# 3 Modularity, Objects and State

## 3.1 Assignment and Local State

The **benefit** of introducing _assignment_ with the technique of _hiding state
in local variables_, is the ability to structure systems in a more _modular_
fashion than if all state had to be manipulated explicitly, by passing
additional parameters.

The **cost** of introducing _assignment_ is that a programming language can no
longer be interpreted in terms of the substitution model of procedure
application.

A **referentially transparent** language is a language that supports the concept
that "equals can be substituted for equals" in an expresssion without changing
the value of the expression. Referential transparency is violated when we
include `set!` in our computer language.

**Functional** vs **imperative** programming:

* _Functional programming_ is a programming paradigm that treats computation as
  the evaluation of _mathematical functions_ and avoids state and mutable data.
  It emphasizes the application of functions without any use of _assignments_.
  Many functional programming languages can be viewed as elaborations on the
  _lambda calculus_.
* _Imperative programming_ is a programming paradigm that describes computation
  in terms of statements that change a program _state_. It introduces
  _time-varying state_. In addition to raising complications about computational
  models, programs written in imperative style are susceptible to bugs that
  cannot occur in functional programs. The complexity of imperative programs
  becomes even worse if we consider applications in which several processes
  execute concurrently.


## 3.2 The Environment Model of Evaluation

We say that a variable, V, is " **bound** in an expression", E, if the meaning
of E is _unchanged_ by the uniform replacement of a variable, W, not occuring in
E, for every occurrence of V in E.

We say that a variable, V, is " **free** in an expression", E, if the meaning of
E is _changed_ by the uniform replacement of a variable, W, not occuring in E,
for every occurrence of V in E.

If X is a bound variable in E then there is a lambda expression where it is
bound. We call the list of formal parameters of the lambda expression the "bound
variable list" and we say that the lambda expression "binds" the variable
"declared" in its bound variable list. In addition, those parts of the
expression where a variable has a value defined by the lambda expression which
binds it, is called the " **scope** " of the variable.

The **substitution** model for procedure application:

* To apply a compound procedure to arguments, evaluate the body of the procedure
with each formal parameter replaced by the corresponding argument.

The **environment** model of procedure application:

* A procedure is **created** by evaluating a lambda expression relative to a
given environment. The resulting procedure object is a _pair_ consisting of _the
text of the lambda expression_ and a _pointer to the environment_ in which the
procedure was created.
* A procedure object is **applied** to a set of arguments by constructing a
frame, binding the formal parameters of the procedure to the actual arguments of
the call, and then evaluating the body of the procedure in the context of the
new environment constructed. The new frame has as its enclosing environment the
environment part of the procedure object being applied.

The **environment** model thus explains the two key properties that make **local
procedure definitions** a useful technique for modularizing programs:

* The names of the local procedures do not interfere with names external to the
  enclosing procedure, because the local procedure names will be bound in the
  frame that the procedure creates when it is run, rather than being bound in
  the global environment.
* The local procedures can access the arguments of the enclosing procedure,
  simply by using parameter names as free variables. This is because the body of
  the local procedure is evaluated in an environment that is subordinate to the
  evaluation environment for the enclosing procedure.

We say that an **action**, A, had an effect on an object, X, (or equivalently,
that X was changed by A) if some property, P, which was true of X before A
became false of X after A.

**Identity.** We say that two objects, X and Y, are the same if any action which
has an effect of X has the same effect on Y.


## 3.3 Modeling with Mutable Data

To model compound objects with changing state, design data abstractions to
include, in addition to selectors and constructors, operations called
**mutators**, which modify data objects. Basic **mutators** are defined for
_pairs_, so that _pairs_ can serve as building blocks for constructing mutable
data objects. Data objects for which _mutators_ are defined are known as
**mutable data objects**. Mutation is just **assignment**.

**Queues** and **Tables**

**Event-driven simulation**, in which actions ("events") trigger further events
that happen at a later time, which in turn trigger more events, and so on.

_Nondirectionality_ of computation is the distinguishing feature of
**constraint-based systems**.


## 3.4 Concurrency: Time Is of the Essence

For any events A and B, either A occurs _before_ B, A and B are _simultaneous_,
or A occurs _after_ B.

**Serialization** implements the following idea: Processes will execute
concurrently, but there will be certain collections of procedures that cannot be
executed concurrently.

**Mutual exclusion (Mutex)** refers to the problem of ensuring that no two
processes or threads can be accessing a shared resource, such as shared memory.

A **semaphore** (of size n) is a generalization of a mutex. Like a mutex, a
semaphore supports acquire and release operations, but it is more general in
that up to n processes can acquire it concurrently. Additional processes that
attempt to acquire the semaphore must wait for release operations.

In many cases a _mutex_ has a concept of an **"owner"**: the process which
locked the mutex is the only process allowed to unlock it. In contrast,
_semaphores_ generally do not have this restriction.

Semaphores which allow an arbitrary resource count are called **counting
semaphores**, while semaphores which are restricted to the values 0 and 1 (or
locked/unlocked, unavailable/available) are called **binary semaphores** (same
functionality that mutexes have).

**Deadlock** avoidance by securing a shared resource with the lower id first.


## 3.5 Streams

If **time** is measured in discrete steps, then we can model a **time** function
as a (possibly infinite) sequence.

**Streams** are _delayed lists_. Streams use the technique of _delayed
evaluation_, which enables us to represent very large (even infinite) sequences
as streams.

**Stream processing** lets us model systems that have _state_ without ever using
_assignment_ or _mutable data_. Moreover, they avoid some of the theoretical
tangles that accompany the introduction of assignment into a programming
language.

Iterative processes proceed by updating **state** variables. We can _represent_
**state** as a "timeless" stream of values rather than as a set of variables to
be updated.

We write procedures as if the streams existed "all at once" when, in reality,
the computation is performed incrementally, as in traditional programming
styles.

**Delay** decouples the _apparent_ order of events in our programs from the
_actual_ order of the events that happen in the machine. Delay throws away time.
We are _decoupling_ time in the programs from time in the machines. If we give
up too much time our language becomes more elegant, but becomes a little bit
less expressive.

_Mutability_ and _delayed evaluation_ do not mix well in programming languages,
and devising ways to deal with both of these at once is an active area of
research.

We began this chapter with the goal of building computational models whose
structure matches our perception of the real world we are trying to model. We
can model the world as a collection of separate, time-bound, interacting objects
with state, or we can model the world as a single, timeless, stateless unity.
Each view has powerful advantages, but neither view alone is completely
satisfactory. **A grand unification has yet to emerge.**
