;; Q: Abstract your answer to exercise 2.30 to produce a procedure tree-map with the property that square-tree could be defined as

; (define (square-tree tree) (tree-map square tree))

;; A:

(define (tree-map fn tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (fn tree))
        (else (cons (tree-map fn (car tree))
                    (tree-map fn (cdr tree))))))
