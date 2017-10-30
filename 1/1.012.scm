;; Q: The following pattern of numbers is called Pascal’s triangle.
;; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

;; A:

(define (pascal a b)
        (cond ((or (= a b) (= b 0)) 1)
              ((or (< a b) (< b 0) (< a 0)) 0)
              ((or (= b 1) (= b (- a 1))) a)
              (else (+ (pascal (- a 1) b) (pascal (- a 1) (- b 1))))
        ))

;; Replacement:

(pascal 4 2)
(+ (pascal 3 2) (pascal 3 1))
(+ 3 3)
6

;; An attempt at an iterative process:

;; (define (pascal a b)
;;  (pascal-iter 1 0 0 0 a b))

;; (define (pascal-iter x y a b counta countb)
;;        (cond ((= 0 counta countb) (+ x y)) ;; Done
;;              ((= a b) (pascal-iter 0 1 (+ a 1) 0 (- counta 1) countb))
;;              (else (pascal-iter ? ? a (+ b 1) counta (- countb 1)))
;;        ))

;; After some time, I realize this is impossible without the use of lists. Maybe less efficient than the recursive process.

;; Example of a more efficient procedure from the Berkeley notes:

(define (new-pascal row col) (nth col (pascal-row row)) )

(define (pascal-row row-num)
  (define (iter in out)
    (if (empty? (bf in))
        out
        (iter (bf in) (se (+ (first in) (first (bf in))) out)) ))
  (define (next-row old-row num)
    (if (= num 0)
        old-row
        (next-row (se 1 (iter old-row '(1))) (- num 1)) ))
  (next-row '(1) row-num) )

;; Replacement:
;; (pascal-row 2)
;; (next-row '(1) 2)
;; (next-row (se 1 (iter '(1) '(1))) 1)
;; (next-row (se 1 '(1)) 1)
;; (next-row '(1 1) 1)
;; (next-row (se 1 (iter '(1 1) '(1))) 0)
;; (next-row (se 1 (iter '(1) (se (+ 1 1)) '(1))) 0)
;; (next-row (se 1 '(2) '(1)) 0)
;; '(1 2 1)
