#lang racket

(define (decode myList)
  (define (second myList)
    (first (rest myList)))
  (define (repeat ch n)
    (if (= n 0)
        null
        (cons ch (repeat ch (- n 1)))))
  (if (null? myList)
      null
      (if (pair? (first myList))
          (append (repeat (second (first myList)) (first (first myList))) (decode (rest myList)))
          (cons (first myList) (decode (rest myList))))))