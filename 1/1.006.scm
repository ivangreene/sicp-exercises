;; Q: "Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. ‘‘Why can’t I just define it as an ordinary procedure in terms of cond?’’ she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

  (define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

;; Eva demonstrates the program for Alyssa:

  (new-if (= 2 3) 0 5)
;; 5
  (new-if (= 1 1) 0 5)
;; 0

;; Delighted, Alyssa uses new-if to rewrite the square-root program:

  (define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                       x)))

;; What happens when Alyssa attempts to use this to compute square roots? Explain"

;; A: Especially for recursive procedures, `if` must be a special form because in an applicative-order evaluation, each argument to a non-special form will be evaluated beforehand. In the special form of `if`, the arguments will only be evaluated based upon the outcome of evaluating the predicate. When Alyssa tries to find a square root with this procedure that employs the `new-if`, she runs into a never ending recursive loop because the "else" statement of the `new-if` is always evaluated, no matter the outcome of the predicate. We need a special form that waits to evaluate its arguments.
