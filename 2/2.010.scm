;; Q: Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoulder and comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa's code to check for this condition and to signal an error if it occurs.

;; A:

(define (interval-width i) (/ (- (upper-bound i) (lower-bound i)) 2))

(define (div-interval x y)
  (if (= 0 (interval-width y))
      (error "Division by an interval of width 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
