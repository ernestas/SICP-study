# 3 Modularity, Objects and State

## 3.1 Assignment and Local State

The **benefit** of introducing _assignment_ with the technique of _hiding state in local variables_, is the ability to structure systems in a more _modular_ fashion than if all state had to be manipulated explicitly, by passing additional parameters.

The **cost** of introducing _assignment_ is that a programming language can no longer be interpreted in terms of the substitution model of procedure application.

A **referentially transparent** language is a language that supports the concept that "equals can be substituted for equals" in an expresssion without changing the value of the expression. Referential transparency is violated when we include `set!` in our computer language.

**Functional** vs **imperative** programming

* _Functional programming_ is a programming paradigm that treats computation as the evaluation of _mathematical functions_ and avoids state and mutable data. It emphasizes the application of functions without any use of _assignments_. Many functional programming languages can be viewed as elaborations on the _lambda calculus_.
* _Imperative programming_ is a programming paradigm that describes computation in terms of statements that change a program _state_. It introduces _time-varying state_.
