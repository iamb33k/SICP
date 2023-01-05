#lang sicp

;1.1.6--Conditional Expressions and Predicates

;Define a procedure (case analysis) for absolute value function
(define (abs x)
  (cond ((< 0 x) x)
        ((= 0 x) 0)
        ((> 0 x) (- x))))

;Another way to write
(define (abs2 x)
  (cond ((> 0 x) (- x))
        (else x)))

;Another way to write, as if statement
(define (abs3 x)
  (if (> 0 x)
      (- x)
      x))

;Exercise 1.1--What is result printed by interpreter for below expressions?

10
;10

(+ 5 3 4)
;12

(- 9 1)
;8

(/ 6 2)
;3

(+ (* 2 4) (- 4 6))
;6

(define a 3)

(define b (+ a 1))

(+ a b (* a b))
;19

(= a b)
;#f

(if (and (> b a) (< b (* a b)))
    b
    a)
;4 (note this returns the value of b, not "b"

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;16

(+ 2 (if (> b a) b a))
;6 (+2 (value of b))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;16 (* b (+ a 1))

;Exercise 1.2--Translate complex fraction into prefix form

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;Rewrite 1.2 in pretty print

(/ (+ 5
      4
      (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;Exercise 1.3--Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers

(define (square x)
  (* x x))

(define (<= x y)
  (or (< x y) (= x y)))

(define (sum-of-squares x y z)
  (cond ((and (<= x y) (<= x z) (+ (square y) (square z))))
        ((and (<= z y) (<= z x) (+ (square y) (square x))))
        ((and (<= y x) (<= y z) (+ (square z) (square x))))))

;Exercise 1.3 refactored using procedure for sum of squares outside of case analysis and else clause

(define (ssq x y)
  (+ (square x) (square y)))

(define (sum-of-squares2 x y z)
  (cond ((and (<= x y) (<= x z) (ssq y z)))
        ((and (<= z y) (<= z x) (ssq x y)))
        (else (ssq x z))))

;Exercise 1.4--Explain the behavior of the following procedure

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;this procedure will add b to a if b is positive, and subtract b from a if b is negative (hence adding it). Therefore it adds the absolute
;value of b

;Exercise 1.5--Explain applicative vs normal order evaluation of the below procedures and test

(define (p) (p))

(define (test x y)
  (if = x 0)
  0
  y)
;Then run (test 0 (p)). If applicative order, the interpreter will never terminate, as (p) will continually expand to itself. If normal order,
;the test will return 0, as we will evalaute the if statement and find = x 0 to be true without worrying about the (p) recursive loop.
