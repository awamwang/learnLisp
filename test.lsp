
(labels 
    (                (add10 
            (x) 
            (+ x 10))
        (consa 
            (lst) 
            (cons 'a lst))))

;(labels 
    (
        (add10 
            (x) 
            (+ x 10))
;        (consa  
            (x) 
            (cons 'a x)))


    (format t "~A" 
        (consa 
            (add10 4)))