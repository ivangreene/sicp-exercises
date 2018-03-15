;; Q: Alyssa's program is incomplete because she has not specified the
;; implementation of the interval abstraction. Here is a definition of the
;; interval constructor:

(define (make-interval a b) (cons a b))

;; Define selectors upper-bound and lower-bound to complete the implementation.

;; A:

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(load "intervals.scm")
