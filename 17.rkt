#lang racket

(define (split myList n)
  (define (inner-split myList n preList)
    (if (or (null? myList) (= n 0))
        (list preList myList)
        (inner-split (rest myList) (- n 1) (append preList (list (first myList))))))
  (inner-split myList n null))