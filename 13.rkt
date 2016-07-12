#lang racket

(define (encode-direct myList)
  (define (second myList)
    (first (rest myList)))
  (define (inner-encode myList ch repeatNum)
    (if (null? myList)
        (list (list repeatNum ch))
        (if (equal? ch (first myList))
            (inner-encode (rest myList) ch (+ 1 repeatNum))
            (cons (list repeatNum ch) (inner-encode (rest myList) (first myList) 1)))))
  (define (modify encodeList)
    (if (null? encodeList)
        null
        (if (= 1 (first (first encodeList)))
            (cons (second (first encodeList)) (modify (rest encodeList)))
            (cons (first encodeList) (modify (rest encodeList))))))
  (if (null? myList)
      null
      (modify (inner-encode (rest myList) (first myList) 1))))