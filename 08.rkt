#lang racket

(define (compress myList)
  (if (or (null? myList) (null? (rest myList)))
      myList
      (if (equal? (first myList) (first (rest myList)))
          (compress (rest myList))
          (cons (first myList) (compress (rest myList)))))) 