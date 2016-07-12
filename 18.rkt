#lang racket

;version 1
(define (slice myList st ed)
  (define (split-prefix myList offset)
    (if (or (null? myList) (= offset 0))
        null
        (cons (first myList) (split-prefix (rest myList) (- offset 1)))))
  (define (split-postfix myList offset)
    (if (or (null? myList) (= offset 0))
        myList
        (split-postfix (rest myList) (- offset 1))))
  (split-postfix (split-prefix myList ed) (- st 1)))

;version 2
(define (slice2 myList st ed)
  (define (inner-slice myList st ed idx)
    (if (or (null? myList) (> idx ed))
        null
        (if (< idx st)
            (inner-slice (rest myList) st ed (+ idx 1))
            (cons (first myList) (inner-slice (rest myList) st ed (+ idx 1))))))
  (inner-slice myList st ed 1))
