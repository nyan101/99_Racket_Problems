#lang racket

(define (prime-factors num)
  (define (inner-factor num factor)
    (cond [(= num 1)                     null]
          [(= (remainder num factor) 0)  (cons factor (inner-factor (/ num factor) factor))]
          [else                          (inner-factor num (+ factor 1))]))
  (inner-factor num 2))