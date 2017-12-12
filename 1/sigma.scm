(define facto
  ((lambda (x) (x x))
    (lambda (fact-gen)
      (lambda (n)
        (if (zero? n)
            1
            (* n ((fact-gen fact-gen) (- n 1)))))))
  )

; (define (sigma term next)
;   ((lambda (x) (x x))
;     (lambda (iter)
;       (lambda (a b)
;         (if (> a b)
;           0
;           (+ (term a) ((iter iter) a (next b)))))))
;   )
