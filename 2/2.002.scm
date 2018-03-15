;; Q: Consider the problem of representing line segments in a plane. Each
;; segment is represented as a pair of points: a starting point and an ending
;; point. Define a constructor make-segment and selectors start-segment and
;; end-segment that define the representation of segments in terms of points.
;; Furthermore, a point can be represented as a pair of numbers: the x
;; coordinate and the y coordinate. Accordingly, specify a constructor
;; make-point and selectors x-point and y-point that define this
;; representation. Finally, using your selectors and constructors, define a
;; procedure midpoint-segment that takes a line segment as argument and returns
;; its midpoint (the point whose coordinates are the average of the coordinates
;; of the endpoints). To try your procedures, you'll need a way to print
;; points:

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

;; A:

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-segment seg)
  (display "(")
  (display (x-point (start-segment seg)))
  (display ", ")
  (display (y-point (start-segment seg)))
  (display ") -> (")
  (display (x-point (end-segment seg)))
  (display ", ")
  (display (y-point (end-segment seg)))
  (display ")")
  (newline))

(define (midpoint-segment seg)
  (make-point (/ (+ (x-point (start-segment seg))
                    (x-point (end-segment seg))) 2)
              (/ (+ (y-point (start-segment seg))
                    (y-point (end-segment seg))) 2)))

(define (square x) (* x x))

(define (segment-length seg)
  (sqrt (+ (square (- (x-point (end-segment seg))
                      (x-point (start-segment seg))))
           (square (- (y-point (end-segment seg))
                      (y-point (start-segment seg)))))))
