#lang racket

(require "math.rkt")

(define (nth-beast-number n)
  (if (<= n 1) 666
      (+ (* (nth-beast-number (- n 1)) 1000) 666)))
        

(define (to-binary n)
  (if (= n 0) 0
      (+ (*(to-binary (quotient n 2)) 10) (remainder n 2))))

(define (reverse-int n)
  (define (helper n result)
    (cond
      [(< n 10) (+(* 10 result) n)]
      [else (helper (quotient n 10) (+(* result 10) (remainder n 10)))]))
  (helper n 0)
  )

(define (palindrome? n)
  (= n (reverse-int n)))

(define (odd? n)
  (=(remainder n 2) 1))

(define (number-ones n)
  (define (helper n counter)
    (cond
      [(= n 0) counter]
      [(= (remainder n 10) 1) (helper (quotient n 10)(+ counter 1))]
      [else (helper (quotient n 10) counter)]))
  (helper (to-binary n) 0)
  )

(define (hack-numbers n)
  (and (odd? (number-ones n))
       (palindrome? (to-binary n))))

(define (next-hack n)
    (if (hack-numbers (+ n 1)) (+ n 1)
        (next-hack (+ n 1))))

(define (p-score n)
  (if (palindrome? n) 1
      (+ (p-score (+ n (reverse-int n))) 1)))
