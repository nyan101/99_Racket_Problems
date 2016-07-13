#lang racket

(define (range st ed)
  (define (range-inc st ed)
    (if (= st ed)
        (list st)
        (cons st (range-inc (+ st 1) ed))))
  (define (range-dec st ed)
    (if (= st ed)
        (list st)
        (cons st (range-dec (- st 1) ed))))
  (if (< st ed)
      (range-inc st ed)
      (range-dec st ed)))