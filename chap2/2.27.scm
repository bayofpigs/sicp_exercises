(define nil '())

(define (deep-reverse items) 
  (define (reverse-iter cur result)
    (cond ((null? cur) result)
          ((pair? (car cur)) (reverse-iter (cdr cur) (cons (reverse (car cur)) result)))
          (else (reverse-iter (cdr cur) (cons (car cur) result)))))
  (reverse-iter items nil))
    
