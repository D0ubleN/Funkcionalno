#lang racket
(define (string-repeat str n)
  (if (= n 1) str
      (string-append str (string-repeat str (- n 1)))))

(define (fence n)
  (string-append "{" (string-repeat "-" (round (+ 1 (log n)))) ">" (number->string n) "<" (string-repeat "-" (round (+ 1 (log n)))) "}"))
