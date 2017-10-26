;; Linear recursive process:
;; Creates a chain of deferred operations, which grows linearly with n

(define (factorial n) (* n (if (= n 1) 1 (factorial (- n 1)))))

;; Alternatively,
;; Linear iterative process:
;; State can be summarized by a fixed number of state variables (arguments to counter). Number of steps grows linearly with n

(define (factorial n)
  (define (counter current product)
    (if (= current n) (* n product)
      (counter (+ current 1) (* product current))))
  (counter 1 1))

