;; Q: "Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
  (define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b)) ;; "

;; A: Our expression `(if (> b 0) + -)` will evaluate to either the + or - primitive operators based upon the predicate `(> b 0)`. This illustrates the concept of "procedure as data" well because the procedure may change based on the predicate.
