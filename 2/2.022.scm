;; Q: Louis Reasoner tries to rewrite the first square-list procedure of
;; exercise 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; Unfortunately, defining square-list this way produces the answer list in the
;; reverse order of the one desired. Why?

;; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;; This doesn't work either. Explain.

(define (square x) (* x x))

;; A: His first attempt reverses the list because at each iteration, it builds
;; a list beginning with the first value from the items squared, and the rest
;; of the list being that same list from the last iteration (it begins as nil).
;; In his second attempt, the returned value will be a pair who's first element
;; is also a pair of the same form, and the second value is the final term of
;; the list. In order, but nonetheless a malformed list.
