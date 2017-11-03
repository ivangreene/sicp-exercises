;; Q: Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

(define runningtime real-time-clock)  ;; I use real-time-clock here for mit-scheme
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
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

;; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of O(sqrt(n)), you should expect that testing for primes around 10,000 should take about sqrt(10) times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the
;; sqrt(n) prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

;; A:

(define (search-for-primes low high count)
  (cond ((or (>= low high) (<= count 0)))
        ((even? low) (search-for-primes (+ low 1) high count))
        (else (timed-prime-test low) (search-for-primes (+ low 2) high (if (prime? low) (- count 1) count))) ))

;; Obviously the processing speed of personal computers has increased significantly since the second edition of this book was published in the 1990's, so I had to go a bit higher to see any values > 0 coming from the timed test.
;; Searching for numbers above 1,000,000 gave mostly 1's, above 10,000,000 gave 3's and 4's. Above 100,000,000 gave 10's-12's, and above 1,000,000,000 gave 33's-35's.
;; It appears that the time does grow by about sqrt(n). 10*sqrt(10) =~ 32
;; This does support the notion that programs on a machine run in time proportional to the number of steps required
