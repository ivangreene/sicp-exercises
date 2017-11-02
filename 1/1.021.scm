;; Q: Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

;; A:

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (square x) (* x x))

(smallest-divisor 199)
(find-divisor 199 2)
(find-divisor 199 3)
(find-divisor 199 4)
(find-divisor 199 5)
(find-divisor 199 6)
(find-divisor 199 7)
(find-divisor 199 8)
(find-divisor 199 9)
(find-divisor 199 10)
(find-divisor 199 11)
(find-divisor 199 12)
(find-divisor 199 13)
(find-divisor 199 14)
(find-divisor 199 15)
199
