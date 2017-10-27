;;Q: "Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

  (define (p) (p))
  (define (test x y)
    (if (= x 0)
        0
        y))

;; Then he evaluates the expression

  (test 0 (p))

;; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)"

;; A: In an interpreter using applicative-order evaluation, evaluating the expression `(test 0 (p))` will result in an infinite recursive loop as the second argument `(p)` is immediately evaluated which points to itself with no way of exiting.
;; In an interpreter using normal-order evaluation, evaluating that expression will have a result of `0` because we test the first argument against 0. `p` is never called because in normal-order evaluation, our inner expressions are not evaluated until they are actually needed.
