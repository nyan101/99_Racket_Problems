#lang racket

(define (my-but-last myList)
  (if (or (null? myList)
          (null? (rest myList)))
      null
      (if (null? (rest (rest myList)))
          myList
          (my-but-last (rest myList)))))