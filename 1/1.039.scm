;; Q: A continued fraction representation of the tangent function was published
;; in 1770 by the German mathematician J. H. Lambert:

;; tan x = x/(1-(x^2/(3-(x^2/(5-...

;; where x is in radians. Define a procedure (tan-cf x k) that computes an
;; approximation to the tangent function based on Lambert's formula. k
;; specifies the number of terms to compute, as in exercise 1.37.

;; A:

(define (cont-frac n d k)
  (define (iter val l)
    (if (> 1 l)
        val
        (iter (/ (n l) (+ (d l) val)) (- l 1))))
  (iter 0 k))

(define (tan-cf x k)
  (define xsquared (* x x))
  (define (odds n) (- (* n 2) 1))
  (define (square-if-not-one n)
    (if (= n 1) x (- xsquared)))
  (cont-frac square-if-not-one odds k))
