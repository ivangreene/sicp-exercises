;; Q: Using reasoning analogous to Alyssa's, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval.

;; A: To find the difference of two intervals, subtract the upper bound of the
;; second interval from the lower bound of the first interval, and subtract the
;; lower bound of the second interval from the upper bound of the first
;; interval.

;; Example: i1: 2.1~2.6
;;          i2: 4.3~4.8
;;    i2 - i1 = 1.7~2.7

(load "2.007.scm")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
