#lang racket

(define (rotate myList n)
  (define (split myList n)
    (define (inner-split myList n preList)
      (if (or (null? myList) (= n 0))
          (list preList myList)
          (inner-split (rest myList) (- n 1) (append preList (list (first myList))))))
     (inner-split myList n null))
  (define (modular num mod)
    (remainder (+ (remainder num mod) mod) mod))
  (define (inverse myList)
    (append (first (rest myList)) (first myList)))
  (inverse (split myList (modular n (length myList)))))