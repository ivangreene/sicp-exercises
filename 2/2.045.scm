;; Q: Right-split and up-split can be expressed as instances of a general
;; splitting operation. Define a procedure split with the property that
;; evaluating

; (define right-split (split beside below))

; (define up-split (split beside beside))

;; produces procedures right-split and up-split with the same behaviors as the
;; ones already defined.

;; A:

(define (split a b)
  ((lambda (x) (x x))
   (lambda (split-recursive)
     (lambda (painter n)
       (if (= n 0)
           painter
           (let ((smaller ((split-recursive split-recursive) painter (- n 1))))
             (a painter (b smaller smaller))))))))
