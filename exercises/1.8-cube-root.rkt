#lang sicp

(define (square x) (* x x))

(define (3rt-iter guess x)
  (if (good-enough? guess x)
      guess
      (3rt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x) 
   (= (improve guess x) guess)) 

; change initial guess to 1.1 to prevent an anomalous result for cube root of -2 
(define (3root x)
  (3rt-iter 1.1 x))

(3root 9)
(3root 27)
(3root -2)
(3root 0)

