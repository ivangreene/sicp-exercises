;; Q: The width of an interval is half of the difference between its upper and
;; lower bounds. The width is a measure of the uncertainty of the number
;; specified by the interval. For some arithmetic operations the width of the
;; result of combining two intervals is a function only of the widths of the
;; argument intervals, whereas for others the width of the combination is not a
;; function of the widths of the argument intervals. Show that the width of the
;; sum (or difference) of two intervals is a function only of the widths of the
;; intervals being added (or subtracted). Give examples to show that this is
;; not true for multiplication or division.

;; A: In an addition or subtraction operation on intervals, the width of the
;; result will be the sum of the widths of the original intervals. Here is a
;; procedure to find the interval width.

(define (interval-width i) (/ (- (upper-bound i) (lower-bound i)) 2))

;; i1 = (1L, 1U)
;; i2 = (2L, 2U)
;; isum = (1L + 2L, 1U + 2U)
;; idiff = (1L - 2U, 1U - 2L)
;; i1 width = (1U-1L)/2
;; i2 width = (2U-2L)/2
;; i1 width + i2 width = (1U-1L)/2 + (2U-2L)/2 = (1U-1L+2U-2L)/2
;; isum width = ((1U+2U) - (1L+2L))/2          = (1U-1L+2U-2L)/2
;; idiff width = ((1U-2L) - (1L-2U))/2         = (1U-1L+2U-2L)/2

;; This doesn't hold for multiplication or division.

;; iproduct = (1L*2L, 1U*2U)
;; iproduct width = ((1U*2U) - (1L*2L))/2
;; iquotient = (1L/2U, 1U/2L)
;; iquotient width = ((1U/2L) - (1L/2U))/2
