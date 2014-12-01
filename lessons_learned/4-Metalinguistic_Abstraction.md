# 4 Metalinguistic Abstraction

Metalinguistic abstraction -- establishing new languages.

An **evaluator** (or **interpreter**) for a programming language is a procedure
that, when applied to an expression of the language, performs the actions
required to evaluate that expression.

The most fundamental idea in programming: **The evaluator, which determines the
meaning of expressions in a programming language, is just another program.**

## 4.1 The Metacircular Evaluator

An **evaluator** that is written in the same language that it evaluates is said
to be **metacircular**.

The **evaluation process** can be described as the _interplay_ between two
procedures: **eval** and **apply**:

* **Eval** takes as arguments an expression and an environment. It classifies
  the expression and directs its evaluation. Eval is structured as a case
  analysis of the syntactic type of the expression to be evaluated.
* **Apply** takes two arguments, a procedure and a list of arguments to which
  the procedure should be applied.

## 4.2 Variations on a Scheme — Lazy Evaluation

If the body of a procedure is entered before an argument has been evaluated we
say that the procedure is **non-strict** in that argument.

If the argument is evaluated before the body of the procedure is entered we say
that the procedure is **strict** in that argument.

In a purely applicative-order language, all procedures are strict in each
argument. In a purely normal-order language, all compound procedures are
non-strict in each argument, and primitive procedures may be either strict or
non-strict. There are also languages that give programmers detailed control over
the strictness of the procedures they define.
