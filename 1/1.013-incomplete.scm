;; Q: Prove that Fib(n) is the closest integer to Phi^n/sqrt(5), where Phi=(1+sqrt(5))/2. Hint: Let Psi=(1-sqrt(5))/2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (Phi^n - Psi^n)/sqrt(5).

;; A:

(define phi (/ (+ 1 (sqrt 5)) 2))
(define psi (/ (- 1 (sqrt 5)) 2))

(define (^ base exp)
        (define (^iter current count)
                (cond ((<= count 0) current)
                      (else (^iter (* current base) (- count 1)))
                ))
        (^iter 1 exp))

(define (fib n) (/ (- (^ phi n) (^ psi n)) (sqrt 5)))

;; Inductive proof that Fib(n) = (Phi^n - Psi^n)/sqrt(5):

;; Phi^2 = Phi + 1
;; Psi^2 = Psi + 1

; Fib(0) = 0
; Fib(1) = 1
; Fib(2) = Fib(1) + Fib(0) = 1 + 0 = 1

(fib 0)
(/ (- (^ phi 0) (^ psi 0)) (sqrt 5))
(/ (- 1 1) (sqrt 5))
(/ 0 (sqrt 5))
0

(fib 1)
(/ (- (^ phi 1) (^ psi 1)) (sqrt 5))
(/ (- phi psi) (sqrt 5))
(/ (- (/ (+ 1 (sqrt 5)) 2) (/ (- 1 (sqrt 5)) 2)) (sqrt 5))
(/ (- (+ 0.5 (/ (sqrt 5) 2)) (- 0.5 (/ (sqrt 5) 2))) (sqrt 5))
(/ (+ 0.5 (/ (sqrt 5) 2) -0.5 (/ (sqrt 5) 2)) (sqrt 5))
(/ (+ (/ (sqrt 5) 2) (/ (sqrt 5) 2)) (sqrt 5))
(/ (* (/ (sqrt 5) 2) 2) (sqrt 5))
(/ (sqrt 5) (sqrt 5))
1

(fib 2)
(/ (- (^ phi 2) (^ psi 2)) (sqrt 5))
(/ (- (+ phi 1) (+ psi 1)) (sqrt 5))
(/ (- (+ (/ (+ 1 (sqrt 5)) 2) 1) (+ (/ (- 1 (sqrt 5)) 2) 1)) (sqrt 5))
(/ (+ 1 -1 (/ (+ 1 (sqrt 5)) 2) (* (/ (- 1 (sqrt 5)) 2) -1)) (sqrt 5))
(/ (- (/ (+ 1 (sqrt 5)) 2) (/ (- 1 (sqrt 5)) 2)) (sqrt 5))
(/ (- (+ 0.5 (/ (sqrt 5) 2)) (- 0.5 (/ (sqrt 5) 2))) (sqrt 5))
(/ (+ 0.5 (/ (sqrt 5) 2) -0.5 (/ (sqrt 5) 2)) (sqrt 5))
(/ (+ (/ (sqrt 5) 2) (/ (sqrt 5) 2)) (sqrt 5))
(/ (* (/ (sqrt 5) 2) 2) (sqrt 5))
(/ (sqrt 5) (sqrt 5))
1

