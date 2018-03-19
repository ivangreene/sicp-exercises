;; Q: Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

; (reverse (list 1 4 9 16 25))

; (25 16 9 4 1)

;; A: An iterative procedure using no other list helpers than those introduced
;; in the chapter (null?, nil, cons, car and cdr).

(define (reverse lis)
  (define (reverse-iter lis result)
    (if (null? lis)
        result
        (reverse-iter (cdr lis) (cons (car lis) result))))
  (reverse-iter lis nil))
