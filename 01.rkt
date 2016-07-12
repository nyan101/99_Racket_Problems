#lang racket

(define (my-last myList)
  (if (null? myList)
      null
      (if (null? (rest myList))
          (first myList)
          (my-last (rest myList)))))