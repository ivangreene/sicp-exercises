;; Q: The ``eight-queens puzzle'' asks how to place eight queens on a
;; chessboard so that no queen is in check from any other (i.e., no two queens
;; are in the same row, column, or diagonal). One possible solution is shown in
;; figure 2.8. One way to solve the puzzle is to work across the board, placing
;; a queen in each column. Once we have placed k - 1 queens, we must place the
;; kth queen in a position where it does not check any of the queens already on
;; the board. We can formulate this approach recursively: Assume that we have
;; already generated the sequence of all possible ways to place k - 1 queens in
;; the first k - 1 columns of the board. For each of these ways, generate an
;; extended set of positions by placing a queen in the kth column. Now filter
;; these, keeping only the positions for which the queen in the kth column is
;; safe with respect to the other queens. This produces the sequence of all
;; ways to place k queens in the first k columns. By continuing this process,
;; we will produce not only one solution, but all solutions to the puzzle.

;; We implement this solution as a procedure queens, which returns a sequence
;; of all solutions to the problem of placing n queens on an n * n chessboard.
;; Queens has an internal procedure queen-cols that returns the sequence of all
;; ways to place queens in the first k columns of the board.

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

;; In this procedure rest-of-queens is a way to place k - 1 queens in the first
;; k - 1 columns, and new-row is a proposed row in which to place the queen for
;; the kth column. Complete the program by implementing the representation for
;; sets of board positions, including the procedure adjoin-position, which
;; adjoins a new row-column position to a set of positions, and empty-board,
;; which represents an empty set of positions. You must also write the
;; procedure safe?, which determines for a set of positions, whether the queen
;; in the kth column is safe with respect to the others. (Note that we need
;; only check whether the new queen is safe--the other queens are already
;; guaranteed safe with respect to each other.)

;; A:

;; Initially, I think the most natural solution would be a list of numbers
;; representing columns, with each number corresponding to the row that a queen
;; is in for that column.

; not-in? as a predicate will help us define no-adjacents?

(define (not-in? item seq)
  (cond ((null? seq) #t)
        ((= (car seq) item) #f)
        (else (not-in? item (cdr seq)))))

; empty-board will be an empty list

(define empty-board nil)

; adjoin-position disregards k and prepends the new-row to the rest

(define (adjoin-position new-row k rest)
  (cons new-row rest))

; no-adjacents simply calls not-in? to make sure that no other queens are
; placed in the same row

(define (no-adjacents? positions)
  (not-in? (car positions) (cdr positions)))

; no-diagonals? iterates through to the end of our board configuration list to
; determine if any pieces in the rest of the board conflict diagonally with the
; latest piece, comparing the row of each piece with the row of our current
; piece, plus or minus the offset. This means, for example, if our current
; piece was in row 3, the piece in the next column may not be in rows 3+1 or
; 3-1, the piece in the column after that may not be in rows 3+2 or 3-2, etc.

(define (no-diagonals? positions)
  (define (iter row offset rest)
    (cond ((null? rest) #t)
          ((or (= (car rest) (- row offset))
               (= (car rest) (+ row offset)))
           #f)
          (else (iter row (+ offset 1) (cdr rest)))))
  (iter (car positions) 1 (cdr positions)))

; combine these two predicates to create safe?

(define (safe? k positions)
  (and (no-adjacents? positions)
       (no-diagonals? positions)))

; for an imporved version, we could just combine the two operations since we're
; iterating through the list already:

(define (safe? k positions)
  (define (iter row offset rest)
    (cond ((null? rest) #t)
          ((or (= (car rest) (- row offset))
               (= (car rest) row)
               (= (car rest) (+ row offset)))
           #f)
          (else (iter row (+ offset 1) (cdr rest)))))
  (iter (car positions) 1 (cdr positions)))

;; Throughout this exercise, I didn't need to make use of k at all. I'm curious
;; as to whether the authors included k as a parameter to confuse, or if their
;; intended solution relied upon it.
