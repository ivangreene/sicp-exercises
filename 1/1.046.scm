;; Q: Several of the numerical methods described in this chapter are instances
;; of an extremely general computational strategy known as iterative
;; improvement. Iterative improvement says that, to compute something, we start
;; with an initial guess for the answer, test if the guess is good enough, and
;; otherwise improve the guess and continue the process using the improved
;; guess as the new guess. Write a procedure iterative-improve that takes two
;; procedures as arguments: a method for telling whether a guess is good enough
;; and a method for improving a guess. Iterative-improve should return as its
;; value a procedure that takes a guess as argument and keeps improving the
;; guess until it is good enough. Rewrite the sqrt procedure of section 1.1.7
;; and the fixed-point procedure of section 1.3.3 in terms of
;; iterative-improve.

;; A:

(define (iterative-improve good? improve)
  (lambda (guess)
    (if (good? guess)
      guess
      ((iterative-improve good? improve) (improve guess)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve (lambda (y) (close-enough? y (f y))) f) first-guess))

(define (average x y) (/ (+ x y) 2))

(define (improve-sqrt guess x)
  (average guess (/ x guess)))

(define (sqrt-good-enough? guess x)
  (< (abs (- (* guess guess) x)) tolerance))

(define (sqrt x)
  ((iterative-improve
     (lambda (y) (sqrt-good-enough? y x))
     (lambda (y) (improve-sqrt y x))) 1))
