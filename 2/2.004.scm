;; Q: Here is an alternative procedural representation of pairs. For this
;; representation, verify that (car (cons x y)) yields x for any objects x and
;; y.

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

;; What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the substitution model of section 1.1.5.)

;; A:

(define pair (cons 1 2))
(car pair)
(pair (lambda (p q) p))
((lambda (m) (m 1 2)) (lambda (p q) p))
((lambda (p q) p) 1 2)
1

;; Explained: cons returns a lambda function accepting one argument, a
;; procedure, which will be called with the two values passed to cons. car
;; accepts one argument, and calls that argument, a procedure, with a lambda
;; function accepting two arguments, and then returns the first of those
;; arguments.

;; Here is the corresponding cdr procedure:

(define (cdr z)
  (z (lambda (p q) q)))

;; It's exactly the same as car, but returns the second rather than first item.
