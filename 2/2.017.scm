;; Q: Define a procedure last-pair that returns the list that contains only the
;; last element of a given (nonempty) list:

; (last-pair (list 23 72 149 34))

; (34)

;; A:

(define (last-pair lis)
  (if (null? (cdr lis))
    lis
    (last-pair (cdr lis))))
