#lang racket

(define (lotto-select N M)
  ;From P22
  (define (range-inc st ed)
    (if (= st ed)
        (list st)
        (cons st (range-inc (+ st 1) ed))))
  ;From P23
  (define (rnd-select myList n)
    (define (element-at myList idx)
      (if (null? myList)
          null
          (if (= idx 1)
              (first myList)
              (element-at (rest myList) (- idx 1)))))
    (define (remove-at myList idx)
      (if (null? myList)
          null
          (if (= idx 1)
              (rest myList)
              (cons (first myList) (remove-at (rest myList) (- idx 1))))))
    (if (or (null? myList) (<= n 0))
        null
        (let ([randIdx (+ (random (length myList)) 1)])
          (cons (element-at myList randIdx) (rnd-select (remove-at myList randIdx) (- n 1))))))
  ;actual code
  (rnd-select (range-inc 1 M) N))