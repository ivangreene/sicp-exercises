(define (sort sent)
        (if (empty? sent)
            '()
            (insert (first sent) (sort (bf sent)) )))

(define (insert num sent)
        (cond ((empty? sent) (se num))
        ((< num (first sent)) (se num sent))
        (else (se (first sent) (insert num (bf sent)))) ))
