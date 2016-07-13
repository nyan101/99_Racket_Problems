#lang racket

(define (combination numItem myList)
  (cond [(> numItem (length myList)) null]
        [(= numItem 0) '(())]
        [else (append (map (lambda (l) (cons (first myList) l)) (combination (- numItem 1) (rest myList)))
                      (combination numItem (rest myList)))]))