#lang racket

(define (rnd-permu myList)
  ;From P03
  (define (element-at myList idx)
  (if (null? myList)
      null
      (if (= idx 1)
          (first myList)
          (element-at (rest myList) (- idx 1)))))
  ;From P20
  (define (remove-at myList idx)
    (if (null? myList)
        null
        (if (= idx 1)
            (rest myList)
            (cons (first myList) (remove-at (rest myList) (- idx 1))))))
  ;actual code
  (if (null? myList)
      null
      (let ([randIdx (+ (random (length myList)) 1)])
        (cons (element-at myList randIdx) (rnd-permu (remove-at myList randIdx))))))