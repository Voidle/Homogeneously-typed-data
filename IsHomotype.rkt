#lang racket

(define (get-type x)
  (cond
    ((number? x)
     "number"
     )
    ((boolean? x)
     "boolean"
     )
    ((pair? x)
     "pair"
     )
    ((list? x)
     "list"
     )
    ((string? x)
     "string"
     )
    ((symbol? x)
     "symbol"
     )
    ((char? x)
     "char"
     )
    ((vector? x)
     "vector"
     )
    ((port? x)
     "port"
     )
    ((procedure? x)
     "procedure"
     )
    )
  )

(define (check l)
    (cond ((empty? l)
          l
          )
          (else
           (cond(
                 (not(null? (cdr l)))
                 (cond(
                       (equal? (get-type (car l)) (get-type (cadr l)))
                       (check (cdr l))
                       ;#t
                       )
                       (else
                        #f
                       )
                 )
                )
                (else
                 #t
                 )
           )
          )
    )
)

(define l (list 5 3 '() 2))
