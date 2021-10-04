#lang sicp


(define (square x)(* x x))
; We need to cover all the combinations:

; [x y z]
; Combination 1: [(x)(y)z] -> (+ (square x) (square y))
; Combination 2: [x(y)(z)] -> (+ (square y) (square z))
; Combination 3: [(x)y(z)] -> (+ (square x) (square z))
(define (sum-of-squares x y z)
  (cond ((and (> (+ x y) (+ y z))(> (+ x y) (+ z x))) (+ (square x) (square y)))
        ((and (> (+ y z) (+ x y))(> (+ y z) (+ z x))) (+ (square y) (square z)))
        ((and (> (+ x z) (+ x y))(> (+ x z) (+ y z))) (+ (square x) (square z)))))