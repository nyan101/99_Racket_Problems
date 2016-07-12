#lang racket

(define (repli myList n)
  (define (repeat ch n)
    (if (= 0 n)
        null
        (cons ch (repeat ch (- n 1)))))
  (if (null? myList)
      null
      (append (repeat (first myList) n) (repli (rest myList) n))))
