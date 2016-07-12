#lang racket

;simple version
(define (my-reverse1 myList)
  (if (null? myList)
      null
      (append (my-reverse1 (rest myList)) (list (first myList)))))

;TCE version
(define (my-reverse2 myList)
  (define (inner-reverse myList revList)
    (if (null? myList)
        revList
        (inner-reverse (rest myList) (cons (first myList) revList))))
  (inner-reverse myList null))
