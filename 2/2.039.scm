;; Q: Complete the following definitions of reverse (exercise 2.18) in terms of
;; fold-right and fold-left from exercise 2.38:

; (define (reverse sequence)
;   (fold-right (lambda (x y) <??>) nil sequence))

; (define (reverse sequence)
;   (fold-left (lambda (x y) <??>) nil sequence))

;; A:

(load "2.038.scm")

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
