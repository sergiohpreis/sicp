#lang sicp

(define (A x y)
  (cond ((= y 0 ) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(A 1 10) ; Equals to 2 raised to 10 = 1024
(A 2 4)  ; Equals to (A 1 16) or 2^(2^(2^2))
(A 2 3)  ; Equals to (A 1 4) or 2^(2^2)
(A 1 16) ; Equals to 2 raised to 16 = 65536
(A 3 3)  ; Equals to (A 2 4) (Using substitution model will became (A 2 4) at some point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (f n) (A 0 n))   ; computes 2N
(define (g n) (A 1 n))   ; computes 2^N
(define (h n) (A 2 n))   ; computes 2^2^2^...(n-1) times for 2 > 1 / 2^h(n-1) -> (A 2 3) -> (A 1 (A 2 2))
(define (k n) (* 5 n n)) ; computes 5(n^n)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(f 2) ; 2*2         -> 4
(g 3) ; 2^3         -> 8
(h 4) ; 2^(2^(2^2)) -> 65536
(k 2) ; 5*(2*2)     -> 20