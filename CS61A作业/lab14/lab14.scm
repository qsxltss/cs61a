(define (split-at lst n)
  'YOUR-CODE-HERE
  (define (help1 lst n)
	(if (null? lst) nil
		(if (= n 0) nil
			(cons (car lst) (help1 (cdr lst) (- n 1)))
		)
	)
  )
  (define (help2 lst n)
	(if (null? lst) nil
		(if (= n 0) lst
			(help2 (cdr lst) (- n 1))
		)
	)
  )
  (cons (help1 lst n) (help2 lst n))
)

'不太会
(define-macro (switch expr cases)
	 (cons 'cond 
	   (map (lambda (case) (cons (eq? (eval expr) (car case)) (cdr case))) 
    			cases))
)

