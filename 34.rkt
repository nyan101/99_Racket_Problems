#lang racket

(define (totient-phi num)
  ;From P33
  (define (coprime a b)
    (define (gcd a b)
      (cond [(< a b)                (gcd b a)]
            [(= (remainder a b) 0)  b]
            [else                   (gcd b (remainder a b))]))
    (= (gcd a b) 1))
  ;actual code
  (define (inner-phi num factor)
    (cond [(= factor 1)          1]
          [(coprime num factor)  (+ 1 (inner-phi num (- factor 1)))]
          [else                  (inner-phi num (- factor 1))]))
  (inner-phi num num))