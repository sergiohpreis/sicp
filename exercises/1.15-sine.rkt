#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  ; Se o angulo não for maior que 0.1, retorna o angulo
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))


(sine 12.15)

(p (sine (/ 12.15 3.0)))
(p (sine 4.05))                                ; -> #1 Call to (p)
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.3499999999999999)))              ; -> #2 Call to (p)
(p (p (p (sine (/ 1.3499999999999999 3.0)))))
(p (p (p (sine 0.44999999999999996))))         ; -> #3 Call to (p)
(p (p (p 0.4351345505)))

;a -> The procedure p is applied 3 times

;b -> The order of growth in space and number of steps is of O(n)
;     since them grows linearly according the size of n (in this case
;     , the angle value)

; My answer is wrong, correct:
; https://codology.net/post/sicp-solution-exercise-1-15/