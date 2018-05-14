;; Q: We can represent a set as a list of distinct elements, and we can
;; represent the set of all subsets of the set as a list of lists. For example,
;; if the set is (1 2 3), then the set of all subsets is (() (3) (2) (2 3) (1)
;; (1 3) (1 2) (1 2 3)). Complete the following definition of a procedure that
;; generates the set of subsets of a set and give a clear explanation of why it
;; works:

; (define (subsets s)
;   (if (null? s)
;       (list nil)
;       (let ((rest (subsets (cdr s))))
;         (append rest (map <??> rest)))))

;; A: I'll define the function prepend, which will accept a scalar parameter
;; and return a function that prepends that item to the list that is passed to
;; the returned function:

(define (prepend item)
  (lambda (rest) (append (list item) rest)))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (prepend (car s)) rest)))))

;; Explanation: through its recursive definition, subsets will always return a
;; list, which consists of the call to subsets with all but the first element
;; of its parameter list, prepended to the first element of its parameter list
;; prepended to each item in that recursive call to subsets. The recursion ends
;; when subsets is passed the empty list, to which it responds with a list
;; containing only the empty list.

;; More visually:

; (subsets (list 1 2 3))
; rest1 = (subsets (list 2 3))
; rest2 = (subsets (list 3))
; rest4 = (subsets ())
; innermost returns (())
; next returns (() (3))
;; (that is 3 appended to the empty list, which is just (3))
; next returns (() (3) (2) (2 3))
;; 2 prepended to each item in rest, which is (() (3)), prepended by rest
; finally it returns (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;; 1 prepended to each item in the return value of the inner call, prepended by
;; that list also
