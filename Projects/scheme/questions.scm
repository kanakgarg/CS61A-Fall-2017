(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  (map (lambda (s) (cons first s)) rests)
)

(define (zip pairs)
  (list (map car pairs) (map car (map cdr pairs)))
)
;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (index i nums)
    (if (not (null? nums))
      (cons (cons i (cons (car nums) nil)) (index (+ i 1) (cdr nums)))
      nil
    )
  )
  (index 0 s)
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
    (define (sub-list vals total2 denoms2)
      (cond
        ((or (< total2 0) (null? denoms2)) nil)
        ((= total2 0) (list vals))
        ((> total2 0) (append (sub-list (append vals (cons (car denoms2) nil)) (- total2 (car denoms2)) denoms2)
                            (sub-list vals total2 (cdr denoms2))
          ))
      )
    )
    (sub-list nil total denoms)
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           
           (define end 
            (if (null? (cdr body))
                nil
                (cons (let-to-lambda (cadr body)) nil)
              )
            )

           (cons form (cons params (cons (car body) end)))

           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cons (cons (quote lambda) (cons (car (zip values)) (list (let-to-lambda (car body))))) (map let-to-lambda (car (cdr (zip values)))))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
          (let ((identifier (car expr))
               (arg1 (cadr expr))
               (arg2 (car (cddr expr))))


              (list identifier (let-to-lambda arg1) (let-to-lambda arg2))
          )        
         ; END PROBLEM 19
         )))
