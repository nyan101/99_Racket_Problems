#lang racket

;simple version
(define (pack myList)
  (if (null? myList)
      null
      (if (null? (rest myList))
          (list myList)
          (if (equal? (first myList) (first (first (pack (rest myList)))))
              (cons (cons (first myList) (first (pack (rest myList)))) (rest (pack (rest myList))))
              (cons (list (first myList)) (pack (rest myList)))))))

;TCE(?) version(not actually)
(define (pack2 myList)
  (define (inner-pack myList packing)
    (if (null? myList)
        (list packing)
        (if (null? packing)
            (inner-pack (rest myList) (list (first myList)))
            (if (equal? (first myList) (first packing))
                (inner-pack (rest myList) (cons (first myList) packing))
                (cons packing (inner-pack myList `()))))))
  (inner-pack myList `()))
