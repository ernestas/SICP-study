# 4 Metalinguistic Abstraction

Metalinguistic abstraction -- establishing new languages.

An **evaluator** (or **interpreter**) for a programming language is a procedure
that, when applied to an expression of the language, performs the actions
required to evaluate that expression.

**The evaluator, which determines the meaning of expressions in a programming
language, is just another program.**

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
