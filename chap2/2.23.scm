(define (for-each-r func items)
  (if (null? items)
    true
    ((func (car items))
     (for-each (cdr items)))))
