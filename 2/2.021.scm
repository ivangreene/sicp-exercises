;; Q: The procedure square-list takes a list of numbers as argument and returns a list of the squares of those numbers.

; (square-list (list 1 2 3 4))
; (1 4 9 16)

;; Here are two different implementations of square-list. Complete both of them by filling in the missing expressions:

;; A: To help us out we'll define square (doesn't come with STK)

(define (square x) (* x x))

(define (square-list-1 items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map square items))
