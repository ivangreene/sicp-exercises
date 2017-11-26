;; Q: Louis Reasoner is having great difficulty doing exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they find that he has rewritten the expmod procedure to use an explicit multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
m))))
 
;; ‘‘I don’t see what difference that could make,’’ says Louis. ‘‘I do.’’ says Eva. ‘‘By writing the procedure like that, you have transformed the O(log(n)) process into a O(n) process.’’ Explain.

;; A:
;; Eva is correct that this becomes a O(n) process from what we previously optimized
;; to be an O(log(n)) process. Checking if exp is even and then dividing it by 2 using
;; successive squaring was our solution, and Louis attempts to do that here. However,
;; he duplicates the same expmod call rather than using a square function, thereby
;; negating any benefit we would have gained by dividing the exponent in half.
;; The exponent is halved, but the remaining work is doubled. This is effectively the
;; same as using this function without the (even? exp) condition.

;; Another note is that using an interpreter with normal-order evaluation,
;; these procedures would be equivalent, as the expansion made by the square
;; function would also duplicate our work.
