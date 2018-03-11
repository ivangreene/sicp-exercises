;; Q: Define a procedure double that takes a procedure of one argument as
;; argument and returns a procedure that applies the original procedure twice.
;; For example, if inc is a procedure that adds 1 to its argument, then (double
;; inc) should be a procedure that adds 2. What value is returned by

;; (((double (double double)) inc) 5)

(define (inc x) (+ x 1))

;; A:

(define (double f)
  (lambda (x)
    (f (f x))))

;; Attempting an expansion is an utter brainfuck... the function call in the
;; question returns 21, which is the original value plus 16.
;; I consider the function like this: the inner (double double) gives us a
;; lambda function

;; (x) => (double (double x))

;; We then call double with that as our parameter, giving us:

;; (double (lambda (x) (double (double x)))) = (x) => (double (double (double (double x))))

;; Finally, that returned function is called with inc as the parameter,

;; (double (double (double (double inc))))


;; Which gives us, beginning from the inside, (consider where x is as a lambda
;; function, enclosed from the outer incs)

;; (double (double (double (inc (inc x)))))
;; (double (double (inc (inc (inc (inc x))))))
;; (double (inc (inc (inc (inc (inc (inc (inc (inc x)))))))))
;; (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc x))))))))))))))))

;; When counted is a total of 16 incs! Whew. This is then called upon 5, giving
;; us 21
