(load "intervals.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Q: Define a constructor make-center-percent that takes a center and a
;; percentage tolerance and produces the desired interval. You must also define
;; a selector percent that produces the percentage tolerance for a given
;; interval The center selector is the same as the one shown above.

;; A: This answer accepts percentages as a whole number (i.e. 15% is just 15),
;; and returns them in the same way.

(define (make-center-percent c p)
  (make-interval (* c (- 1 (/ p 100))) (* c (+ 1 (/ p 100)))))

(define (percent i)
  (/ (center i) (width i)))
