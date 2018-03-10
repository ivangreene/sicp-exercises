;; Q: Show that the golden ratio phi (section 1.2.2) is a fixed point of the transformation
;; x -> 1 + 1/x, and use this fact to compute phi by means of the fixed-point procedure.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; A: Section 1.2.2 states that:
;;    phi^2 = phi + 1
;; To get to the given equation above, we can divide each side by phi:
;;    phi = 1 + 1/phi

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

;; This gives me 1.61803278688525, which is as close as we tolerated to phi being ~1.6180339887.
