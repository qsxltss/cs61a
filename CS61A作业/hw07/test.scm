(define (pow x y)
  (if (= y 1) x 
       (if (even? y) 
            (square (pow x (/ y 2)))  
            (* x square((pow x (/ (- y 1) 2))))))
)