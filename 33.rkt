#lang racket

(define (coprime a b)
  (define (gcd a b)
    (cond [(< a b) (gcd b a)]
          [(= (remainder a b) 0) b]
          [else (gcd b (remainder a b))]))
  (= (gcd a b) 1))