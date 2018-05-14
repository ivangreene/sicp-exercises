;; Q: A binary mobile consists of two branches, a left branch and a right
;; branch. Each branch is a rod of a certain length, from which hangs either a
;; weight or another binary mobile. We can represent a binary mobile using
;; compound data by constructing it from two branches (for example, using
;; list):

(define (make-mobile left right)
  (list left right))

;; A branch is constructed from a length (which must be a number) together with
;; a structure, which may be either a number (representing a simple weight) or
;; another mobile:

(define (make-branch length structure)
  (list length structure))

;; a. Write the corresponding selectors left-branch and right-branch, which
;; return the branches of a mobile, and branch-length and branch-structure,
;; which return the components of a branch.

;; A:

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))

;; b. Using your selectors, define a procedure total-weight that returns the
;; total weight of a mobile.

;; A: Let's assume that branches themselves weigh nothing (i.e., the weight of
;; a mobile is only the sum of the simple weights attached to any of its
;; branches)

(define (total-weight mob)
  (if (number? mob) mob
  (let ((left (left-branch mob))
        (right (right-branch mob)))
       (+ (total-weight (branch-structure left))
          (total-weight (branch-structure right))))))

;; c. A mobile is said to be balanced if the torque applied by its top-left
;; branch is equal to that applied by its top-right branch (that is, if the
;; length of the left rod multiplied by the weight hanging from that rod is
;; equal to the corresponding product for the right side) and if each of the
;; submobiles hanging off its branches is balanced. Design a predicate that
;; tests whether a binary mobile is balanced.

;; A:

(define (branch-weight branch)
  (let ((struc (branch-structure branch)))
  (if (number? struc)
      struc
      (total-weight struc))))

(define (balanced? mob)
  (if (number? mob) #t
  (let ((left (left-branch mob))
        (right (right-branch mob)))
    (and (balanced? (branch-structure left))
         (balanced? (branch-structure right))
         (= (* (branch-weight left) (branch-length left))
            (* (branch-weight right) (branch-length right)))))))

;; d. Suppose we change the representation of mobiles so that the constructors
;; are

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;; How much do you need to change your programs to convert to the new
;; representation?

;; A: Thanks to the way we built upon abstractions, all we need to change are
;; the accessor functions! And only two of them at that:

(define (right-branch m)
  (cdr m))

(define (branch-structure b)
  (cdr b))
