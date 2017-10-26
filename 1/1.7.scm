;; Q: "The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?"

;; A: Contrary to this question's assertion, our `good-enough?` test seems to work particularly well for larger numbers. It is true however that smaller numbers, even those that are perfect squares, are obviously inaccurate past the decimal point that we test for.
;; The alternative of testing the difference between the current guess and the previous guess seems to give very similar results for smaller numbers, and actually worse results for larger numbers.

(define (sqrt-iter guess x prevguess)
  (if (good-enough? guess prevguess)
    guess
  (sqrt-iter (improve guess x)
    x guess)))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (^2 x) (* x x))

(define (good-enough? guess prevguess) (< (/ (abs (- guess prevguess)) guess) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x 0.0))
