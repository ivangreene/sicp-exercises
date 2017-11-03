;; Q: The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

(define (next n) (if (= n 2) 3 (+ n 2)))

(define runningtime real-time-clock)  ;; I use real-time-clock here for mit-scheme
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

;; I modified this a bit to not display a newline and the number if it is not prime:
(define (timed-prime-test n)
  (start-prime-test n (runningtime)));;(runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runningtime) start-time))))
(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes low high count)
  (cond ((or (>= low high) (<= count 0)))
        ((even? low) (search-for-primes (+ low 1) high count))
        (else (timed-prime-test low) (search-for-primes (+ low 2) high (if (prime? low) (- count 1) count))) ))

;; A:
;; I actually ended up getting results that took about 2/3 the time of the original non-optimized for odd numbers version, rather than 1/2 the time as expected for an optimization that seemingly halves the number of calculations.
;; I would explain this by saying that a seemingly insignificant additional procedure may be adding the running time difference that we are seeing here.
;; To play with this idea, I changed (next) to look like this:
; (define (next n) (if (= n 2) 3 (+ n 1 1)))
; Notice the unnecessary (+ n 1 1) where we should have (+ n 2). This small change added enough processing time to change the running time for the number 1000000007 from 19ms to 21ms.
;; An extra "if" statement evaluation is undoubtedly adding the difference from 1/2 time to 2/3 time.
