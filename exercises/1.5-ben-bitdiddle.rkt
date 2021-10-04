#lang sicp

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Running (test 0 (p))

; If the interpreter uses applicative-order evaluation,
; it will evaluate the expression, and then apply the result
; to the (test) expression.
; Will get stucked on the infinite recursion (p)


; If the interpreter uses normal-order evaluation,
; the "(p)" will never be evaluated, so we will never
; enter in the infinite recursion (p)