(define (find s predicate)
  (if (null? s)
  	#f
  	(if (predicate (car s))
  		(car s)
  		(find (cdr-stream s) predicate)
  		)
  	)

)

(define (scale-stream s k)
	(cons-stream (* (car s) k) (scale-stream (cdr-stream s) k) )
)

(define (has-cycle s)
  (define (cycle x s) 
  	(if (null? x) 
  		#f 
  		(if (eq? s x) 
  			#t 
  			(cycle (cdr-stream x) s)
  		)
  	)
  )
  
  (cycle (cdr-stream s) s) 
)

(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
