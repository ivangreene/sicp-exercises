;; Q: The following pattern of numbers is called Pascal’s triangle.
;; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

;; A:

(define (pascal a b)
        (cond ((or (= a b) (= b 0)) 1)
              ((or (< a b) (< b 0) (< a 0)) 0)
              ((or (= b 1) (= b (- a 1))) a)
              (else (+ (pascal (- a 1) b) (pascal (- a 1) (- b 1))))
        ))

;; An attempt at an iterative process:

(define (pascal a b)
  (pascal-iter 1 0 0 0 a b))

(define (pascal-iter x y a b counta countb)
        (cond ((= 0 counta countb) (+ x y)) ;; Done
              ((= a b) (pascal-iter 0 1 (+ a 1) 0 (- counta 1) countb))
              (else (pascal-iter ? ? a (+ b 1) counta (- countb 1)))
        ))

;; After some time, I realize this is impossible without the use of lists. Maybe less efficient than the recursive process.
