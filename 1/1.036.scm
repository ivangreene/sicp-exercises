;; Q: Modify fixed-point so that it prints the sequence of approximations it
;; generates, using the newline and display primitives shown in exercise 1.22.
;; Then find a solution to x^x = 1000 by finding a fixed point of x ->
;; log(1000)/log(x). (Use Scheme's primitive log procedure, which computes
;; natural logarithms.) Compare the number of steps this takes with and without
;; average damping. (Note that you cannot start fixed-point with a guess of 1,
;; as this would cause division by log(1) = 0.)

;; A:

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (logbase x) (/ (log 1000) (log x)))

(fixed-point logbase 2)

;; Remark: this fixed point of a logarithm procedure must be started with a
;; value > 1; negative values are not within the domain of the log function and
;; values smaller than 1 will return a negative number, violating the former
;; principle on the next evaluation.

(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

;; I would assume this procedure to take twice as many steps (as in calls to f)
;; with average damping

(define (logbase-damped x) ((average-damp (lambda (y) (/ (log 1000) (log y)))) x))
(fixed-point logbase-damped 2)

;; Amazingly I hadn't considered the convergence improvement and was thinking these procedures would roll through the same sequence of guesses, but average damping improves the process significantly. To find the convergence of x -> log(1000)/log(x), beginning with guess of 2, without average damping this took 33 steps, with average damping it took only 8!
