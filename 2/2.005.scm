;; Q: Show that we can represent pairs of nonnegative integers using only
;; numbers and arithmetic operations if we represent the pair a and b as the
;; integer that is the product 2^a * 3^b. Give the corresponding definitions of
;; the procedures cons, car, cdr.

;; A:

(define (cons a b) (* (expt 2 a) (expt 3 b)))

(define (car x)
  (let ((l (/ (log x) (log 2))))
  (if (integer? l)
      l
      (car (/ x 3)))))

(define (cdr x)
  (if (odd? x)
      (/ (log x) (log 3))
      (cdr (/ x 2))))
