#lang sicp


;1.1.3--Evaluating Combinations

(* (+ 2 (* 4 6))
   (+ 3 5 7))

;1.1.4--Compound Procedures

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x)(square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

;Exercism Assignment: Don't have this in the book at this point
;Calculate difference of square of sum and sum of squares and for numbers 1-n

(define (sum-of-squares-to-n n)
  (if (= n 0)
      0
      (+ (square n) (sum-of-squares-to-n (- n 1)))))

(define (square-of-sum-to-n n)
  (define (sum n)
    (if (= n 0)
        0
        (+ n (sum (- n 1)))))
  (square (sum n)))

(define (difference-sums n)
  (- (square-of-sum-to-n n) (sum-of-squares-to-n n)))