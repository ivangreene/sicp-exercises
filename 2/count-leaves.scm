(define (count-leaves items)
  (if (null? items)
      0
      (if (not (pair? items))
          1
          (+ (count-leaves (car items)) (count-leaves (cdr items))))))
