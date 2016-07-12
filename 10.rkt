#lang racket

(define (encode myList)
  (define (my-len myList)
    (if (null? myList)
        0
        (+ 1 (my-len (rest myList)))))
  (define (pack myList)
    (define (inner-pack myList packing)
      (if (null? myList)
          (list packing)
          (if (null? packing)
              (inner-pack (rest myList) (list (first myList)))
              (if (equal? (first myList) (first packing))
                  (inner-pack (rest myList) (cons (first myList) packing))
                  (cons packing (inner-pack myList `()))))))
    (inner-pack myList `()))
  (define (inner-encode packList)
    (if (null? packList)
        null
        (cons (list (my-len (first packList)) (first (first packList))) (inner-encode (rest packList)))))
  (inner-encode (pack myList)))