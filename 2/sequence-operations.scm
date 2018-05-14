;; From the book, these are the four sequence operations from 2.2.3:

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; We could define accumulate iteratively without much work. Unfortunately, it
;; doesn't play well with the list example, but works fine for arithmetic.

(define (accumulate-iter op initial sequence)
  (define (iter val seq)
    (if (null? seq)
        (op val initial)
        (iter (op val (car seq)) (cdr seq))))
  (if (null? sequence) initial
    (iter (car sequence) (cdr sequence))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
