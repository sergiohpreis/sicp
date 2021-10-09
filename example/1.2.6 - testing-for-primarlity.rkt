#lang sicp

(define (square x) (* x x))
  
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

; Order of Growth: O(sqr-root n)
(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 7)
(prime? 9)

; Using Fermat's Little Theorem
; If "n" is a prime number and "a" is any positive integer
; less than "n", then a raised to the nth power is congruent
; to "a modulo n"

; Fermat Test Algorithm
;; Given a number n
;;; 1. Pick a random number "a < n" and compute the remainder of "a raised to n modulo n"
;;;; if the result is not equal to a, then n is not prime
;;;; if it is a, then chances are good that n is prime
;;; 2. Now pick another random number "a" and test it with the same method
;;;; if also satisfies the equation, then we can be even more confident that "n" is prime
;;; 3. By trying more and more values of a, we can increase our confidence in the result

; Computing the exponential of a number modulo another number
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 7 5)
