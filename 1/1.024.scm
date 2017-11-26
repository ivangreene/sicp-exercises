;; Q: Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has   (log n) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

;; A:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define runningtime real-time-clock)  ;; I use real-time-clock here for mit-scheme

(define (prime? n)
  (fast-prime? n 6)) ;; Run the fermat test 6 times with random numbers

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

;; For logarithmic growth, we can expect an input of 1,000,000 to take approximately
;; twice as long as an input of 1000. Base 10 log of 1,000,000 is 6, while base 10 log
;; of 1000 is 3. It's easy to visualize working with scientific number notation, as the
;; base 10 log is just the number after E for 1.

;; Moving to using the fermat test for finding primes we see a great improvement in speed,
;; which translates to an ability to test massive numbers.
;; On a modern computer I had to test quite large inputs to see any change in
;; the reported times.

;; Finding 10 primes starting at 1E74, we have times between 3ms and 4ms.
;; Finding 10 primes starting at 1E95, we have times between 5ms and 7ms.

;; Begin at 1E74:
;; 100000000000000000000000000000000000000000000000000000000000000000000000207 *** 3
;; 100000000000000000000000000000000000000000000000000000000000000000000000363 *** 4
;; 100000000000000000000000000000000000000000000000000000000000000000000000531 *** 4
;; 100000000000000000000000000000000000000000000000000000000000000000000000547 *** 3
;; 100000000000000000000000000000000000000000000000000000000000000000000000903 *** 4
;; 100000000000000000000000000000000000000000000000000000000000000000000001569 *** 4
;; 100000000000000000000000000000000000000000000000000000000000000000000001879 *** 3
;; 100000000000000000000000000000000000000000000000000000000000000000000002521 *** 4
;; 100000000000000000000000000000000000000000000000000000000000000000000002703 *** 3
;; 100000000000000000000000000000000000000000000000000000000000000000000002821 *** 4


;; Begin at 1E95:
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000151 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000367 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001207 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001561 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002043 *** 7
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002211 *** 5
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002299 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002593 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002617 *** 6
;; 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002643 *** 5

;; We would expect primes around 1E95 to take ~1.28 times as long as primes
;; near 1E74. Our data is close to this:
;; Mean average of times for 1E74: 3.6
;; Mean average of times for 1E95: 5.9
;; 5.9/3.6 = ~1.63
;; We can assume the difference is due to more difficult basic arithmetic operations
;; on such large numbers being nonconstant and actually relating to the size of the
;; numbers.
