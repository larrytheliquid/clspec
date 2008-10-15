(clspec:spec)

(defun stub-me () "original")

(describe "describe, without examples")

(describe "describe, with 1 example"
  (it "should run the single example with one line"
    (=> (append '(1 2) '(3 4)) should = '(1 2 3 4)))
  (it "should run the single example with multiple lines"
    (1+ 2)
    (=> (1+ 2) should = 3))
  (it "should run inside of an implicit with-stubs block"
    (stub stub-me (returns "stubbed"))
    (=> (stub-me) should = "stubbed")))

(describe "describe, with 2 examples"
  (it "should run the first example"
    (=> (1+ 6) should = 7))
  (it "should run the second example"
    (=> (1- 6) should = 5)))

;; (describe "describe"
;;   (describe "with nesting"
;;     (it "should run examples"
;;       (=> (* 4 3) should = 12))))

;; (shared-examples-for "describe using shared examples"
;;   (it "should run the shared example"
;;     (=> (cons 1 '(2)) should = '(1 2))))

;; (describe "describe, using shared and other examples"
;;   (it-should-behave-like "describe using shared examples")
  
;;   (it "should run the regular example"
;;     (=> (= 3 3) should = t)))