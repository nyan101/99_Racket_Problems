#lang racket

(define (my-flatten myList)
  (if (null? myList)
      null
      (if (list? (first myList))
          (append (my-flatten (first myList)) (my-flatten (rest myList)))
          (cons (first myList) (my-flatten (rest myList))))))