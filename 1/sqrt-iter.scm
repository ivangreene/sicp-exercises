(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
  (sqrt-iter (improve guess x)
    x)))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (^2 x) (* x x))

(define (good-enough? guess x) (< (abs (- (^2 guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))
