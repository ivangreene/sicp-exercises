;; Q: Louis Reasoner is having a terrible time doing exercise 2.42. His queens
;; procedure seems to work, but it runs extremely slowly. (Louis never does
;; manage to wait long enough for it to solve even the 6 * 6 case.) When Louis
;; asks Eva Lu Ator for help, she points out that he has interchanged the order
;; of the nested mappings in the flatmap, writing it as

; (flatmap
;   (lambda (new-row)
;     (map (lambda (rest-of-queens)
;            (adjoin-position new-row k rest-of-queens))
;          (queen-cols (- k 1))))
;   (enumerate-interval 1 board-size))

;; Explain why this interchange makes the program run slowly. Estimate how long
;; it will take Louis's program to solve the eight-queens puzzle, assuming that
;; the program in exercise 2.42 solves the puzzle in time T.

;; A: The simple syntax rules of Scheme at times may make processes extremely
;; easy to understand, and at other times extremely difficult to understand, in
;; my opinion. Here, Louis's interchange causes the program to run much more
;; slowly because the mapping over an interval from 1 to board-size encloses
;; the mapping over rest-of-queens. At each column of the board, the queen-cols
;; will recursively invoke itself.

;; If the original program took T time to run, Louis's version would take at
;; least T raised to board-size time to run.

(define empty-board nil)

(define (adjoin-position new-row k rest)
  (cons new-row rest))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
(flatmap
  (lambda (new-row)
    (map (lambda (rest-of-queens)
           (adjoin-position new-row k rest-of-queens))
         (queen-cols (- k 1))))
  (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(define (safe? k positions)
  (define (iter row offset rest)
    (cond ((null? rest) #t)
          ((or (= (car rest) (- row offset))
               (= (car rest) row)
               (= (car rest) (+ row offset)))
           #f)
          (else (iter row (+ offset 1) (cdr rest)))))
  (iter (car positions) 1 (cdr positions)))


