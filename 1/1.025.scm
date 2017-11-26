;; Q: Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;; Is she correct? Would this procedure serve as well for our fast prime tester? Explain.


;; Here is fast-expt, alongside expmod for reference:

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


;; A:
;; I'll do some expansion to examine how these both work:
;; Original expmod:
(expmod 5 2 3)
(remainder (square (expmod 5 1 3)) 3)
(remainder (square (remainder (* 5 (expmod 5 0 3)) 3)) 3)
(remainder (square (remainder (* 5 1) 3)) 3)
(remainder (square (remainder 5 3)) 3)
(remainder (square 2) 3)
(remainder 4 3)
1

;; expmod with fast-expt:
(expmod 5 2 3)
(remainder (fast-expt 5 2) 3)
(remainder (square (fast-expt 5 1)) 3)
(remainder (square (* 5 (fast-expt 5 0))) 3)
(remainder (square (* 5 1)) 3)
(remainder (square 5) 3)
(remainder 25 3)
1

;; Testing with further inputs, these functions seem to be the same. One difference
;; is a computation of the remainder at each step. In the version using fast-expt,
;; further along we begin working with larger and larger numbers, not reducing them
;; at each step. We still have the same number of steps, but as mentioned in
;; the previous exercise, primitive arithmetic operations with larger numbers is
;; nonconstant. Our previous method serves us better here by reducing the numbers
;; using remainder at each step. Running a timed test shows this.
