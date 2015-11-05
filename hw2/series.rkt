#lang racket
(define (series a b n)
  (define (helper a b i)
    (if (< i n) (helper b (+ a b) (+ i 1))
        a
        ))
    (helper a b 1)
    )

(define (lucas n)
  (series 2 1 n))

(define (fibonacci n)
  (series 1 1 n))

(define (summed-member n)
  (+ (lucas n) (fibonacci n)))

(define (sum-series a b n)
  (define (helper a b result i)
    (if (< i n) (helper b (+ a b) (+ result a) (+ i 1))
        result))
  (helper a b 0 0)
  )

(define (nth-lucas-sum n)
  (sum-series 2 1 n))

(define (nth-fibonacci-sum n)
  (sum-series 1 1 n))

(define (lucas-fib-diff n)
  (- (lucas n) (fibonacci n)))

