#lang racket

(define (gcd a b)
  (cond [(< a b) (gcd b a)]
        [(= (remainder a b) 0) b]
        [else (gcd b (remainder a b))]))