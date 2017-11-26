;; Q: Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. That is, write a procedure that takes an integer n and tests whether a n is congruent to a modulo n for every a<n, and try your procedure on the given Carmichael numbers.

;; A:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-iter n c)
    (cond ((= c 0) #t)
          ((= (expmod c n n) c) (fermat-iter n (- c 1)))
          (else #f)))

(define (carmichael? n) (fermat-iter n (- n 1)))

;; Demonstration on Carmichael numbers provided:
(carmichael? 561)
#t
(carmichael? 1105)
#t
(carmichael? 1729)
#t
(carmichael? 2465)
#t
(carmichael? 2821)
#t
(carmichael? 6601)
#t
