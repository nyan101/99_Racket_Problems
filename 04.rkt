#lang racket

;simple version
(define (my-len1 myList)
  (if (null? myList)
      0
      (+ 1 (my-len1 (rest myList)))))

;TCE version
(define (my-len2 myList)
  (define (inner-len innerList len)
    (if (null? innerList)
        len
        (inner-len (rest innerList) (+ len 1))))
  (inner-len myList 0))
