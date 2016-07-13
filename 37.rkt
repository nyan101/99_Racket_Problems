#lang racket

;From P13. with little modification
(define (encode-direct myList)
  (define (inner-encode myList ch repeatNum)
    (cond [(null? myList)         (list (list ch repeatNum))]
          [(= ch (first myList))  (inner-encode (rest myList) ch (+ 1 repeatNum))]
          [else                   (cons (list ch repeatNum) (inner-encode (rest myList) (first myList) 1))]))
  (if (null? myList)
      null
      (inner-encode (rest myList) (first myList) 1)))
;From P35
(define (prime-factors num)
  (define (inner-factor num factor)
    (cond [(= num 1)                     null]
          [(= (remainder num factor) 0)  (cons factor (inner-factor (/ num factor) factor))]
          [else                          (inner-factor num (+ factor 1))]))
  (inner-factor num 2))
;sub-function
(define (calc-phi plist)
  (if (null? plist)
      1
      (let ([p (first (first plist))] [exp (first (rest (first plist)))])
        (* (* (- p 1) (expt p (- exp 1))) (calc-phi (rest plist))))))
;actual code
(define (totient-phi2 num)
  (calc-phi (encode-direct (prime-factors num))))