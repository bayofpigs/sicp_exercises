(define nil '())

; Iterative procedure
(define (reverse-iterative l) 
  (define (reverse-iter result remaining)
    (if (null? remaining)
      result
      (reverse-iter (cons (car remaining) result) (cdr remaining))))
  (reverse-iter nil l))

