;; Q: Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order. For example:

(define x (list (list 1 2) (list 3 4)))

; (fringe x)
; (1 2 3 4)

; (fringe (list x x))
; (1 2 3 4 1 2 3 4)

;; A:

(define (fringe tree)
  (cond ((null? tree) ())
        ((list? tree)
         (append (fringe (car tree)) (fringe (cdr tree))))
        (else (list tree))))

;; This recursive procedure simply appends the return value of itself called
;; with the car and cdr of its argument, if it is a non empty list. No matter
;; what, fringe will return a list, which can then be used as a parameter to
;; append further up the call stack
