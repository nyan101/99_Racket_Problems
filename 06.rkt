#lang racket

(define (my-palindrome? myList)
  (define (my-reverse myList)
    (define (inner-reverse myList revList)
      (if (null? myList)
          revList
          (inner-reverse (rest myList) (cons (first myList) revList))))
    (inner-reverse myList null))
  (equal? myList (my-reverse myList)))