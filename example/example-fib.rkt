#lang sicp

(define (fib-recursive n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recursive (- n 1))
                 (fib-recursive (- n 2))))))

(fib-recursive 5)
; (+ (fib-recursive 4) (fib-recursive 3))
; (+ (+ (fib-recursive 3) (fib-recursive 2)) (+ (fib-recursive 2) (fib-recursive 1)))
; (+ (+ (+ (fib-recursive 2) (fib-recursive 1)) (+ (fib-recursive 1) (fib-recursive 0))) (+ (+ (fib-recursive 1) (fib-recursive 0)) 1))
; (+ (+ (+ (fib-recursive 2) 1) (+ 1 0)) (+ (+ 1 0) 1))
; (+ (+ (+ (+ (fib-recursive 1) (fib-recursive 0)) 1) (+ 1 0)) (+ (+ 1 0) 1))
; (+ (+ (+ (+ 1 0) 1) (+ 1 0)) (+ (+ 1 0) 1)) -> 5

(define (fib-iterative n)
  (fib-iter 1 0 n))
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fib-iterative 5)
; (fib-iter (+ 1 0) 1 (- 5 1)) -> (fib-iter 1 1 4)
; (fib-iter (+ 1 1) 1 (- 4 1)) -> (fib-iter 2 1 3)
; (fib-iter (+ 2 1) 2 (- 3 1)) -> (fib-iter 3 2 2)
; (fib-iter (+ 3 2) 3 (- 2 1)) -> (fib-iter 5 3 1)
; (fib-iter (+ 5 3) 5 (- 1 1)) -> (fib-iter 8 5 0) -> count is equal to 0, return 5