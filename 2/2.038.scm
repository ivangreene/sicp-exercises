;; Q: The accumulate procedure is also known as fold-right, because it combines
;; the first element of the sequence with the result of combining all the
;; elements to the right. There is also a fold-left, which is similar to
;; fold-right, except that it combines elements working in the opposite
;; direction:

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

;; What are the values of

; (fold-right / 1 (list 1 2 3))

; (fold-left / 1 (list 1 2 3))

; (fold-right list nil (list 1 2 3))

; (fold-left list nil (list 1 2 3))

;; Give a property that op should satisfy to guarantee that fold-right and
;; fold-left will produce the same values for any sequence.

;; A:

; (fold-right / 1 (list 1 2 3))
; (/ 1 (/ 2 (/ 3 1)))
; (/ 1 (/ 2 3))
; (/ 1 2/3)
; 3/2

; (fold-left / 1 (list 1 2 3))
; (/ 1 1)
; (/ 1 2)
; (/ 1/2 3)
; 1/6

; (fold-right list nil (list 1 2 3))
; (list 1 (list 2 (list 3 nil)))
; (1 (2 (3 ())))

; (fold-left list nil (list 1 2 3))
; (list nil 1)
; (list (list nil 1) 2)
; (list (list (list nil 1) 2) 3)
; (((() 1) 2) 3)

;; For fold-right and fold-left to be guaranteed to produce the same result, op
;; must be order independent. Operations like +, * are good candidates.
