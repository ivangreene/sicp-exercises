;; Q: Suppose we define the procedure

(define (f g)
  (g 2))

;; Then we have

(f square)
; 4
(f (lambda (z) (* z (+ z 1))))
; 6

;; What happens if we (perversely) ask the interpreter to evaluate the
;; combination (f f)? Explain.

;; A: Calling (f f) will result in an error because 2 is not a procedure.
;; The expansion would look something like this:

; (f f)
; (f 2)
; (2 2)
; Error: ...

;; f expects its argument to be a function that could be called with a number.
;; Calling f on itself breaks that rule (it expects a function, not a number).
