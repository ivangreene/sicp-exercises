(define (average x y) (/ (+ x y) 2))

(define (close-enough? x y) (< (abs (- x y)) 0.001))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

; Expansion
; (define (less3 x) (- x 3))
; (search less3 -4 8)
; (search less3 2 8)
; (search less3 2 5)
; (search less3 2 3.5)
; (search less3 2.75 3.5)
; (search less3 2.75 3.125)
; (search less3 2.9375 3.125)
; (search less3 2.9375 3.03125)
; (search less3 2.984375 3.03125)
; (search less3 2.984375 3.0078125)
; (search less3 2.99609375 3.0078125)

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
            (error "Values are not of opposite sign" a b)))))
