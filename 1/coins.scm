
; a = change amount
; n = kinds of coins
; d = denomination of first coin

; (ways a n) (ways to change amount a using n kinds of coins):
; (+ (ways a (- n 1)) (ways (- a d) n))

;; My solution:

(define (ways a n)
  (define (denomination)
  (cond ((= n 5) 50)
        ((= n 4) 25)
        ((= n 3) 10)
        ((= n 2) 5)
        ((= n 1) 1)
        (else 0)))
  (cond ((= a 0) 1)
        ((< a 0) 0)
        ((= n 0) 0)
        (else (+ (ways a (- n 1)) (ways (- a (denomination)) n)))))


;; From the book:

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1)) (cc (- amount (first-denomination kinds-of-coins))
                                                      kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

