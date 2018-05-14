;; Q: Redefine count-leaves from section 2.2.2 as an accumulation:

; (define (count-leaves t)
;   (accumulate <??> <??> (map <??> <??>)))

;; A:

(load "sequence-operations.scm")

(define (terminal? x)
  (null? x))

(define (leaf? x)
  (not (pair? x)))

(define (count-leaves t)
  (accumulate + 0 (map
                    (lambda (x)
                      (cond ((terminal? x) 0)
                            ((leaf? x) 1)
                            (else (count-leaves x))))
                    t)))
