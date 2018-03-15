;; Q: In case representing pairs as procedures wasn't mind-boggling enough,
;; consider that, in a language that can manipulate procedures, we can get by
;; without numbers (at least insofar as nonnegative integers are concerned) by
;; implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; This representation is known as Church numerals, after its inventor, Alonzo
;; Church, the logician who invented the λ calculus.

;; Define one and two directly (not in terms of zero and add-1). (Hint: Use
;; substitution to evaluate (add-1 zero)). Give a direct definition of the
;; addition procedure + (not in terms of repeated application of add-1).

;; A:

;; Substitution:

; (add-1 zero)
; (add-1 (lambda (f) (lambda (x) x)))
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (plus n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))

;; My understanding is that these Church numerals represent an integer N as a
;; function which takes a function as an argument, and returns a function which
;; takes one argument and the passed function will be called with that argument
;; N times.

;; Here's a simple demonstration to see how they work, using actual numbers as
;; the arguments passed, for clarity:

(define (inc x) (+ x 1))

((zero inc) 0)
; 0
((one inc) 0)
; 1
((two inc) 0)
; 2
(((plus one two) inc) 0)
; 3
(((plus (plus two one) (plus two two)) inc) 0)
; 7
