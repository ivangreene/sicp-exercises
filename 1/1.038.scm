;; Q: In 1737, the Swiss mathematician Leonhard EUler published a memoir De
;; Fractionibus Continuis, which included a continued fraction expansion for
;; e-2, where e is the base of the natural logarithms. In this fraction, the Ni
;; are all 1, and the Di are successively 1,2,1,1,4,1,1,6,1,1,8,... Write a
;; program that uses your cont-frac procedure from exercise 1.37 to approximate
;; e, based on Euler's expansion.

(define (cont-frac n d k)
  (define (iter val l)
    (if (> 1 l)
        val
        (iter (/ (n l) (+ (d l) val)) (- l 1))))
  (iter 0 k))

;; A:

(define (euler n)
  (if (= 0 (modulo (+ n 1) 3))
      (* (/ (+ n 1) 3) 2)
      1))

(cont-frac (lambda (x) 1.0) euler 30)
