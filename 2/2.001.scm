;; Q: Define a better version of make-rat that handles both positive and
;; negative arguments. Make-rat should normalize the sign so that if the
;; rational number is positive, both the numerator and denominator are
;; positive, and if the rational number is negative, only the numerator is
;; negative.

;; A:

(define (rat-sign n d)
  (if (or (and (> n 0) (> d 0))
          (and (< n 0) (< d 0)))
      1
      -1
  ))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (* (rat-sign n d) (abs (/ n g)))
          (abs (/ d g)))))

;; In an attempt to make this as modular as possible, going along with the
;; theme of the book, rat-sign only takes 2 parameters: numerator and
;; denominator. It need have no notion of how a rational number be represented.
;; It then returns 1 for positive rationals, and -1 for negative rationals,
;; which may then be multiplied by the absolute value of numerator to give the
;; normalized rational.
