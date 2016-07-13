#lang racket

;From P33
(define (coprime a b)
  (define (gcd a b)
    (cond [(< a b)                (gcd b a)]
          [(= (remainder a b) 0)  b]
          [else                   (gcd b (remainder a b))]))
  (= (gcd a b) 1))

;From P34. with little modification
(define (totient-phi1-cnt num)
  (define (inner-phi-cnt num factor)
    (cond [(= factor 1)          1]
          [(coprime num factor)  (+ 1 (inner-phi-cnt num (- factor 1)))]
          [else                  (+ 1 (inner-phi-cnt num (- factor 1)))]))
  (inner-phi-cnt num num))

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

;From P37. with little modification
(define (calc-phi-cnt plist)
  (if (null? plist)
      1
      (let ([p (first (first plist))] [exp (first (rest (first plist)))])
        (+ 1 (calc-phi-cnt (rest plist))))))
(define (totient-phi2-cnt num)
  (calc-phi-cnt (encode-direct (prime-factors num))))

;actual code
(define (compare-totient-phi num)
  (list (totient-phi1-cnt num) (totient-phi2-cnt num)))