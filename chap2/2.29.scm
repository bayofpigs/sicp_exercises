; Mobile 'Class' Definition
; -------------------------
; Constructor
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))


(define (branch-weight branch)
  (if (pair? (branch-structure branch))
    (total-weight (branch-structure branch))
    (branch-structure branch)))

(define (total-weight mobile)
  (define (left-weight mobile)
    (if (pair? (branch-structure (left-branch mobile)))
      (total-weight (branch-structure (left-branch mobile)))
      (branch-structure (left-branch mobile))))
  (define (right-weight mobile)
    (if (pair? (branch-structure (right-branch mobile)))
      (total-weight (branch-structure (right-branch mobile)))
      (branch-structure (right-branch mobile))))
  (+ (left-weight mobile) (right-weight mobile)))

(define (balanced? mobile)
  (define (left-balanced mob)
    (if (pair? (branch-structure (left-branch mob)))
      (balanced? (branch-structure (left-branch mob)))
      true))
  (define (right-balanced mob)
    (if (pair? (branch-structure (right-branch mob)))
      (balanced? (branch-structure (right-branch mob)))
      true))
  (and (= (* (branch-weight (left-branch mobile)) (branch-length (left-branch mobile)))
          (* (branch-weight (right-branch mobile)) (branch-length (right-branch mobile))))
       (right-balanced mobile)
       (left-balanced mobile)))

; Changing the definition would require changing the accessors, primarily left-branch,
; right-branch, branch-structure and possibly branch-length

;testing - Test cases stolen from schemewiki

(left-branch (make-mobile 2 3)) 
(right-branch (make-mobile 2 3)) 
(branch-length (make-branch 4 5)) 
(branch-structure (make-branch 4 5)) 

(define level-1-mobile (make-mobile (make-branch 2 1) 
                                    (make-branch 1 2))) 
(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                    (make-branch 9 1))) 
(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                    (make-branch 8 2)))

(total-weight level-1-mobile) 
(total-weight level-2-mobile) 
(total-weight level-3-mobile) 

;; Usage: 
(balanced? (make-mobile (make-branch 2 3) 
                                           (make-branch 3 2)))

;; Usage: 
(balanced? level-1-mobile) 
(balanced? level-2-mobile) 
(balanced? level-3-mobile) 

(balanced? (make-mobile (make-branch 10 1000) (make-branch 1 level-3-mobile)))
