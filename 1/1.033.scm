;; Q: You can obtain an even more general version ofaccumulate(exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure.

(define (filtered-accumulate filter? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (if (filter? a) (combiner (term a) result) result))))
  (iter a null-value))

;; Show how to express the following using filtered-accumulate:

;; a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)

(define (identity x) x)
(define (++ x) (+ x 1))
(define (sum-squares-of-primes a b)
  (filtered-accumulate prime? + 0 identity a ++ b))

;; b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).


(define (gcdl n) (lambda (i) (= (gcd i n) 1)))
(define (product-all-posi-ints-less-than-n-relatively-prime-to-n n)
  (filtered-accumulate (gcdl n) * 1 identity 1 ++ n))
