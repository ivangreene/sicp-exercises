;; Q: Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
;; x/y^2 + 2y
;; ----------
;;     3
;; Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In section 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

(define (cubert-iter guess x)
  (if (good-enough? guess x)
    guess
  (cubert-iter (improve guess x) x)))

(define (improve guess x) (/ (+ (/ x (^2 guess)) (* 2 guess)) 3))

(define (^2 x) (* x x))
(define (^3 x) (* x x x))

(define (good-enough? guess x) (< (abs (- (^3 guess) x)) 0.001))

(define (cubert x) (cubert-iter 1.0 x))
