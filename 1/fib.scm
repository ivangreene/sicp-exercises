;; Tree recursion

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

                                      (fib 5)
(+                 (fib 4)                                      (fib 3))
(+            (+ (fib 3) (fib 2))                       (+ (fib 2)       (fib 1)))
(+ (+ (+ (fib 2) (fib 1)) (+ (fib 1) (fib 0)))    (+ (+ (fib 1) (fib 0))     1))
(+ (+ (+ (+ (fib 1) (fib 0)) 1) (+ 1 0)) (+ (+ 1 0) 1))
(+ (+ (+ (+ 1 0) 1) 1) 2)
(+ (+ (+ 1 1) 1) 2)
(+ (+ 2 1) 2)
(+ 3 2)
5

;; Linear iteration

(define (fib n)
  (fib-iter 1 0 n))
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fib 5)
(fib-iter 1 0 5)
(fib-iter 1 1 4)
(fib-iter 2 1 3)
(fib-iter 3 2 2)
(fib-iter 5 3 1)
(fib-iter 8 5 0)
5

