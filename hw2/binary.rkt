#lang racket
(define (string-reverse str)
  (define (helper i)
    (if (< i 0) ""
        (string-append (~a(string-ref str i)) (helper (- i 1)))))
  (helper (-(string-length str) 1))
  )

(define (to-binary n)
  (if (= n 0) 0
      (+ (*(to-binary (quotient n 2)) 10) (remainder n 2))))


(define (to-binary-string n)
  (~a (to-binary n)))

(define (from-binary-string binary-str)
  (to-binary (string->number binary-str)))
