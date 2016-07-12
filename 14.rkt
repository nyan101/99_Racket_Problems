#lang racket

(define (dupli myList)
  (if (null? myList)
      null
      (append (list (first myList) (first myList)) (dupli (rest myList)))))