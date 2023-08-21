(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (define (f x) (cons first x))
  (map f rests)
)

(define (zip pairs)
  (define (f prs y1 y2)
    (if (null? prs)
      (list y1 y2)
      (f (cdr prs) (append y1 (list (car (car prs))) ) (append y2 (list (car(cdr (car prs)))) ))
    )
  )
  (f pairs nil nil)
)

;; Problem 16
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 16
  (define (f x s) 
    (if (null? s) 
      nil 
      (cons (list x (car s)) (f (+ x 1) (cdr s)))
    )
  )
  (f 0 s)
  )
  ; END PROBLEM 16

;; Problem 17
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 17
  (if (= total 0) (list nil)
    (if (null? denoms) nil
        (if (>= total (car denoms))
            (append 
                (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
                (list-change total (cdr denoms))
            )
            (list-change total (cdr denoms))
        )
    )
  )
)
  ; END PROBLEM 17

;; Problem 18
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))
(define (f x y)
  (if (null? x)
    y
    (f (cdr x) (append y (cdr (car x))))                
  )
)
(define (g x y)
  (if (null? x)
    y
    (g (cdr x) (append y (list (car (car x)))))                
  )
)
;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 18
         expr
         ; END PROBLEM 18
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
           (define left (list form))
           (define mid (append left (list params)))
           (append mid (map let-to-lambda body))
           ; END PROBLEM 18
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 18
            (define tmp (zip values))
           (append (cons (cons 'lambda (cons (car tmp) (map let-to-lambda body))) nil) (map let-to-lambda (cadr tmp)))
           ; END PROBLEM 18
           ))
        (else
         ; BEGIN PROBLEM 18
          (cons (car expr) (map let-to-lambda (cdr expr)))
         ; END PROBLEM 18
         )))