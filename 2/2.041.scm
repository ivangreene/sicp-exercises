;; Q: Write a procedure to find all ordered triples of distinct positive
;; integers i, j, and k less than or equal to a given integer n that sum to a
;; given integer s.

;; A:

(load "flatmap.scm")

(define (distinct-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k)) (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (sum-to? sum seq)
  (= sum (accumulate + 0 seq)))

(define (triples-sum-to n s)
  (filter (lambda (triple) (sum-to? s triple))
          (distinct-triples n)))
