(define nil '())

(define (list-filter l query)
  (cond ((null? l) nil)
        ((query (car l)) (cons (car l) (list-filter (cdr l) query)))
        (else (list-filter (cdr l) query))))

(define (same-parity? a b)
  (= (remainder a 2) (remainder b 2)))

; Parity checker 2000
(define (same-parity init . l) 
  (define (same-parity-with-init? a)
    (same-parity? init a))
  (if (null? l) 
    (list init)
    (cons init (list-filter l same-parity-with-init?))))
