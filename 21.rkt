#lang racket

; append at the end for inappropriate values(ex. negative, or too large)
(define (insert-at item myList idx)
  (if (null? myList)
      (list item)
      (if (= idx 1)
          (cons item myList)
          (cons (first myList) (insert-at item (rest myList) (- idx 1))))))