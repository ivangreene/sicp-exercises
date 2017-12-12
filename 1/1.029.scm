;; Q: Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as

;; h/3 * [y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2yn-2 + 4yn-1 + yn]

;; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing n increases the accuracy of
;; the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integratecubebetween 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above.

;; A:

(load "sum.scm")

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yterm k)
    (cond ((or (= k 0) (= k n)) (f (+ a (* k h))))
          ((even? k) (* 2 (f (+ a (* k h)))))
          ((odd? k) (* 4 (f (+ a (* k h)))))
    ))
  (* (/ h 3) (sum yterm a ++ n)))

(simpson cube 0.0 1.0 100)
;; .24999999999999992
(simpson cube 0.0 1.0 1000)
;; .2500000000000003

;; The results of Simpson's Rule are much more accurate in the same number
;; of steps.
