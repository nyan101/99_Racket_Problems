#lang racket

(define (element-at myList idx)
  (if (null? myList)
      null
      (if (= idx 1)
          (first myList)
          (element-at (rest myList) (- idx 1)))))