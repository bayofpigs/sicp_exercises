
(define (fringe x)
  (cond ((null? x) x)
        ((pair? (car x)) (append (fringe (car x)) (fringe (cdr x))))
        (else (cons (car x) (fringe (cdr x))))))

