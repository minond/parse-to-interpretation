;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Standard Library Tests
;;
;; 1. Internal functions
;; 2. Core functions
;; 3. List and pairs
;; 4. Comparison
;; 5. Logic
;; 6. Math
;; 7. Test helpers
;; 8. Macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Internal functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Core functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'true? '(boolean? #f))
(assert 'true? '(boolean? #t))
(assert 'true? '(builtin? eval))
(assert 'true? '(error? (error 'ok)))
(assert 'true? '(false? #f))
(assert 'true? '(integer? 123))
(assert 'true? '(lambda? (lambda () 'ok)))
(assert 'true? '(list? '()))
(assert 'true? '(list? '(1 2 3)))
(assert 'true? '(list? (list 1 2 3)))
(assert 'true? '(list? (list)))
(assert 'true? '(null? '()))
(assert 'true? '(pair? (cons 1 2)))
(assert 'true? '(quote? 'ok))
(assert 'true? '(real? 1.2))
(assert 'true? '(string? "ok"))
(assert 'true? '(true? #t))
(assert 'true? '(zero? 0))
(assert 'true? '(number? -1))
(assert 'true? '(number? 0))
(assert 'true? '(number? 1))
(assert 'true? '(number? 1.0))

(assert 'equal? '(list 2 4 6 8) '(map double '(1 2 3 4)))
(assert 'equal? 10 '(fold 0 + '(1 2 3 4)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; List and pairs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'equal? '(list 1 2 3) '(list 1 2 3))
(assert 'equal? '(list 1 2 3) '(list (+ 1) (+ 1 1) (+ 1 1 1)))
(assert 'equal? 1 '(first '(1 2 3 4)))
(assert 'equal? 2 '(second '(1 2 3 4)))
(assert 'equal? 3 '(third '(1 2 3 4)))
(assert 'equal? 4 '(length '(1 2 3 4)))
(assert 'equal? 4 '(nth 3 '(1 2 3 4)))
(assert 'equal? 4 '(last '(1 2 3 4)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Comparison
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'equal? #t '(= 1 1))
(assert 'equal? #f '(= 0 1))
(assert 'equal? #t '(= 0 0))
(assert 'equal? #f '(= "0" 0))
(assert 'equal? #f '(= 0 "0"))
(assert 'equal? #f '(= "0" "0"))
(assert 'equal? #f '(!= 1 1))
(assert 'equal? #t '(!= 0 1))
(assert 'equal? #f '(!= 0 0))
(assert 'equal? #f '(>= 0 1))
(assert 'equal? #t '(>= 1 1))
(assert 'equal? #t '(>= 2 1))
(assert 'equal? #f '(< 2 1))
(assert 'equal? #f '(< 2 2))
(assert 'equal? #t '(< 1 2))
(assert 'equal? #f '(<= 2 1))
(assert 'equal? #t '(<= 2 2))
(assert 'equal? #t '(<= 1 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Logic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'equal? #t '(all? integer? 1 2 3 4 5))
(assert 'equal? #f '(all? integer? 1 2 3 4 5.0))
(assert 'equal? #t '(all? integer?))
(assert 'equal? #t '(or #f #f #t invalid invalid invalid))
(assert 'equal? #t '(or 1 2 3 4))
(assert 'equal? #f '(and #f #f #t))
(assert 'equal? #t '(and #t #t #t))
(assert 'equal? #t '(and 1 2 3 4))
(assert 'equal? #t '(not #f))
(assert 'equal? #f '(not #t))
(assert 'equal? #f '(not '()))
(assert 'equal? #f '(not 0))
(assert 'equal? #f '(not ""))
(assert 'equal? #f '(not 'ok))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Math
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'equal? 4 '(double 2))
(assert 'equal? 16 '(double 8))
(assert 'equal? 9 '(triple 3))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test helpers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'true? '(ok? 'ok))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(assert 'equal? 24
  '(-> 2
      (double)
      (double)
      (triple)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Finish
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(printf "done.")
(newline)
