#lang sicp

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough-v2? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; Not effective for finding square roots of small and big numbers
; For small numbers 0.0001 is a very big tolerance
; For big numbers, the machine precision is unable to represent small differences between large numbers. 
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; Comparing the guess and the next guess
(define (good-enough-v2? guess x) 
   (= (improve guess x) guess)) 

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.0001)         ; Wrong Answer (error over 200%)
(sqrt 1000000000000)  ; Answered
(sqrt 10000000000000) ; Infinite Loop

(define x 10000000000000)
(define guess 4472135.954999579)
(improve guess x)
(good-enough? (improve guess x) x)
(improve (improve guess x) x)
(improve (improve (improve guess x) x) x)
(improve (improve (improve (improve guess x) x) x) x)
; From here, always the same value will be returned
(improve (improve (improve (improve (improve guess x) x) x) x) x)
; good-enough? will always return false, causing a infinite loop
(good-enough? (improve (improve (improve (improve (improve (improve guess x) x) x) x) x) x) x)
(improve (improve (improve (improve (improve (improve guess x) x) x) x) x) x)
(improve (improve (improve (improve (improve (improve (improve guess x) x) x) x) x) x) x)
(improve (improve (improve (improve (improve (improve (improve (improve guess x) x) x) x) x) x) x) x)
