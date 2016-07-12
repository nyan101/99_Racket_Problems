#lang racket

(define (drop myList n)
  (define (inner-drop myList n cnt)
    (if (null? myList)
        null
        (if (= cnt n)
            (inner-drop (rest myList) n 1)
            (cons (first myList) (inner-drop (rest myList) n (+ cnt 1))))))
  (inner-drop myList n 1))