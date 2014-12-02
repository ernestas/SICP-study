# 4 Metalinguistic Abstraction

Metalinguistic abstraction -- establishing new languages.

An **evaluator** (or **interpreter**) for a programming language is a procedure
that, when applied to an expression of the language, performs the actions
required to evaluate that expression.

The most fundamental idea in programming: **The evaluator, which determines the
meaning of expressions in a programming language, is just another program.**

The technology for coping with large-scale computer systems merges with the
technology for building new computer languages, and _computer science_ itself
becomes no more (and no less) than the discipline of constructing appropriate
descriptive languages.

## 4.1 The Metacircular Evaluator

An **evaluator** that is written in the same language that it evaluates is said
to be **metacircular**.

The job of the evaluator is not to specify the primitives of the language, but
rather to provide the connective tissue - the means of combination and the means
of abstraction - that binds a collection of primitives to form a language.

The **evaluation process** can be described as the _interplay_ between two
procedures: **eval** and **apply**:

* **Eval** takes as arguments an _expression_ and an _environment_. It
  classifies the expression and directs its evaluation. Eval is structured as a
  case analysis of the syntactic type of the expression to be evaluated.
* **Apply** takes a _procedure_ and a _list of arguments_ to which the procedure
  should be applied. Apply classifies procedures into two kinds: it calls
  apply-primitive-procedure to apply primitives; it applies compound procedures
  by sequentially evaluating the expressions that make up the body of the
  procedure. The environment for the evaluation of the body of a compound
  procedure is constructed by extending the base environment carried by the
  procedure to include a frame that binds the parameters of the procedure to the
  arguments to which the procedure is to be applied.

We can transform the evaluator to be significantly more efficient
by arranging things so that syntactic analysis is performed only once.
We split eval, which takes an expression and an environment, into two
parts. The procedure analyze takes only the expression. It performs the
syntactic analysis and returns a new procedure, the execution procedure,
that encapsulates the work to be done in executing the analyzed expres-
sion. The execution procedure takes an environment as its argument
and completes the evaluation. This saves work because analyze will be
called only once on an expression, while the execution procedure may
be called many times.


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
