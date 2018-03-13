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
;; plane, we would need more information. I at first went for what I thought
;; was a simplified approach that represents the rectangle using four points,
;; constructed from two points.

(define (make-rectangle p1 p2 p3 p4)
  (cons (cons p1 p2)
        (cons p3 p4)))

;; Changing the constructor to be able to handle more complicated rectangles
;; not only lying squarely on the plane was trivial! In fact, it simplified the
;; constructor procedure (although it now requires more data from the user of
;; the constructor.) This constructor also assumes that the points are ordered.

;; To (inefficiently and redundantly) represent a rectangle as four segments,
;; our area/perimeter procedures need not be changed, only our constructor and
;; selectors:

(define (make-rectangle p1 p2 p3 p4)
  (cons (cons (make-segment p1 p2)
              (make-segment p2 p3))
        (cons (make-segment p3 p4)
              (make-segment p4 p1))))

(define (rect-side-a rect)
  (car (car rect)))

(define (rect-side-b rect)
  (cdr (car rect)))

(define (rect-point-1 rect)
  (start-segment (car (car rect))))

(define (rect-point-2 rect)
  (start-segment (cdr (car rect))))

(define (rect-point-3 rect)
  (start-segment (car (cdr rect))))

(define (rect-point-4 rect)
  (start-segment (cdr (cdr rect))))
