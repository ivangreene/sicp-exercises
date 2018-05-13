;; Q: Suppose we evaluate the expression

(list 1 (list 2 (list 3 4)))

;; Give the result printed by the interpreter, the corresponding
;; box-and-pointer structure, and the interpretation of this as a tree (as in
;; figure 2.6).

;; A: The interpreter prints:
; (1 (2 (3 4)))

;; As a box and pointer structure:

;; (1 (2 (3 4)))  ((2 (3 4)))
;;      v            v
;;    |---|        |---|
;;    |1| |   ->   |o|/|
;;    |---|        |---|
;;     v            v
;;     1          |---|
;;                |2|o| < (2 (3 4))
;;                |---|
;;                 v > - v
;;                 2   |---|
;;                     |o|/| < ((3 4))
;;                     |---|
;;                      v
;;                    |---|
;;                    |o|/| < (3 4)
;;                    |---|
;;                     v
;;                   |---|
;;                   |3| | < (3 (4))
;;                   |---|
;;                    v > - v
;;                    3   |---|
;;                        |4|/| < (4)
;;                        |---|
;;                         v
;;                         4

;; Tree:
;;          (1 (2 (3 4)))
;;          /           \
;;         1          (2 (3 4))
;;                    /      \
;;                   2      (3 4)
;;                          /   \
;;                         3     4
