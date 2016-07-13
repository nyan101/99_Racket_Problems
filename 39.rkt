#lang racket

;From P31
(define (is-prime num)
  (define (inner-isprime num div)
    (cond [(> (* div div) num) #t]
          [(= (remainder num div) 0) #f]
          [else (inner-isprime num (+ div 1))]))
  (inner-isprime num 2))
;actual code
(define (prime-range st ed)
  (cond [(> st ed)      null]
        [(is-prime st)  (cons st (prime-range (+ st 1) ed))]
        [else           (prime-range (+ st 1) ed)]))