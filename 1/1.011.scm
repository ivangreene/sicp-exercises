;; Q: "A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process."

;; A:

;; Recursive solution:

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))
  ))

;; Replacement expansion:

(f 5)
(+ (f 4) (* 2 (f 3)) (* 3 (f 2)))
(+ (+ (f 3) (* 2 (f 2)) (* 3 (f 1))) (* 2 (+ (f 2) (* 2 (f 1)) (* 3 (f 0)))) (* 3 2))
(+ (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) 4 3) (* 2 (+ 2 2 0)) 6)
(+ (+ (+ 2 2 0) 7) 8 6)
(+ (+ 4 7) 14)
(+ 11 14)
25

;; Iterative solution:

(define (f n) (f-iter 0 1 2 n))

(define (f-iter x y z count)
        (cond ((>= count 3) (f-iter y z (+ z (* 2 y) (* 3 x)) (- count 1)))
              ((= count 2) z)
              ((= count 1) y)
              ((= count 0) x)
        ))

;; Expanded:

(f 5)
(f-iter 0 1 2 5)
(f-iter 1 2 4 4)
(f-iter 2 4 11 3)
(f-iter 4 11 25 2)
25
