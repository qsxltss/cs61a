(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)


(define (sign num)
  'YOUR-CODE-HERE
  (if (< num 0) -1 (if (= num 0) 0 1))
)


(define (square x) (* x x))

(define (pow x y) 
  (if(= y 1)
    x
    (if(even? y)
      (pow (square x) (quotient y 2))
      (* (pow (square x) (quotient y 2)) x) 
    )
  )
)


(define (unique s)
  'YOUR-CODE-HERE
  (define (check_equal x y)
    (if (eq? x y) 1 0)
  )
  (define (check a slist)
    (if (null? slist) 0
        (if (= 1 (check_equal a (car slist))) 1 (check a (cdr slist))))
  )
  (define (remove a slist)
    (if (null? slist) nil
        (if (= 1 (check_equal a (car slist))) (remove a (cdr slist)) (cons (car slist) (remove a (cdr slist))))
    )
  )
  (if (null? s) nil
      (if (= 1 (check (car s) (cdr s))) (cons (car s) (unique (remove (car s) (cdr s)))) (cons (car s) (unique (cdr s))))
  )
)


(define (replicate x n)
  (define (rep_help x n s)
        (if (= n 0) s
            (rep_help x (- n 1) (cons x s))
        )
    )
    (rep_help x n nil)
)


(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
)


(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper combiner n term ans)
      (if (= 0 n) ans
          (helper combiner (- n 1) term (combiner ans (term n)))
      )
  )
  (helper combiner n term start)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
  (list 'map (list 'lambda (list var) map-expr) (list 'filter (list 'lambda (list var) filter-expr) lst))
)

