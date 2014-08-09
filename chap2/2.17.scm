(define nil '())

(define (last-pair a)
  (if (null? (cdr a))
    a
    (last-pair (cdr a))))
