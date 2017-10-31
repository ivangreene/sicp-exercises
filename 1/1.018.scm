;; Q: Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

;; A:

(define (double x) (+ x x))
(define (halve x)
  (define (iter current)
    (cond ((= x (+ current current)) current)
          (else (iter (- current 1))) ))
  (iter (- x 1)))

(define (iter* a b)
  (if (< b a) (iter*-iter a 0 b) (iter*-iter b 0 a)))
  (define (iter*-iter mult add count)
    (cond ((= count 1) (+ mult add))
          ((= count 0) 0)
          ((even? count) (iter*-iter (double mult) add (halve count)))
          (else (iter*-iter mult (+ add mult) (- count 1))) ))
