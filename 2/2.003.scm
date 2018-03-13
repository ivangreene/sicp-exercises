;; Q: Implement a representation for rectangles in a plane. (Hint: You may want
;; to make use of exercise 2.2.) In terms of your constructors and selectors,
;; create procedures that compute the perimeter and the area of a given
;; rectangle. Now implement a different representation for rectangles. Can you
;; design your system with suitable abstraction barriers, so that the same
;; perimeter and area procedures will work using either representation?

;; A: This constructor make-rectangle takes as input two opposing points of a
;; rectangle

(load "2.002.scm")

(define (make-rectangle p1 p2)
  (cons (cons p1
              (make-point (x-point p1)
                          (y-point p2)))
        (cons p2
              (make-point (x-point p2)
                          (y-point p1)))))

(define (rect-point-1 rect)
  (car (car rect)))

(define (rect-point-2 rect)
  (cdr (car rect)))

(define (rect-point-3 rect)
  (car (cdr rect)))

(define (rect-point-4 rect)
  (cdr (cdr rect)))

(define (rect-side-a rect)
  (make-segment (rect-point-1 rect) (rect-point-2 rect)))

(define (rect-side-b rect)
  (make-segment (rect-point-2 rect) (rect-point-3 rect)))

(define (rect-side-a-length rect)
  (segment-length (rect-side-a rect)))

(define (rect-side-b-length rect)
  (segment-length (rect-side-b rect)))

(define (rect-perimeter rect)
  (* 2 (+ (rect-side-a-length rect)
          (rect-side-b-length rect))))

(define (rect-area rect)
  (* (rect-side-a-length rect)
     (rect-side-b-length rect)))

;; During implementation I became hung up on how much data we really need to
;; store to represent a rectangle. Truly all we need to construct it is two
;; points. Would it make sense to represent this using 4 segments? I think not.
;; Then again, if we consider rectangles that do not only lie squarely on a
;; plane, we would need more information. I went for a simplified approach that
;; represents the rectangle using four points, constructed from two points.
