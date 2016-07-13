#lang racket

(define (is-prime num)
  (define (inner-isprime num div)
    (cond [(> (* div div) num) #t]
          [(= (remainder num div) 0) #f]
          [else (inner-isprime num (+ div 1))]))
  (inner-isprime num 2))