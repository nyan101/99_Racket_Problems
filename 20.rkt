#lang racket

(define (remove-at myList idx)
  (if (null? myList)
      null
      (if (= idx 1)
          (rest myList)
          (cons (first myList) (remove-at (rest myList) (- idx 1))))))