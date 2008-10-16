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

(describe "describe, with a before block"
  (before ((block-variable ""))
    (setf block-variable "block variable"))
	  
  (it "should make its variables accessible to 'it' constructs"
    (=> block-variable should = "block variable")))

(describe "describe, with root level"
  (it "should run examples in the root level"
    (=> t should = t))
  
  (describe "with nesting"
    (it "should run examples in a nested level"
      (=> t should = t))
    
    (describe "with deeper nesting"
      (it "should run examples in the deepest"
	(=> t should = t))))

  (describe "with separate nesting"
    (it "should run separate examples"
      (=> t should = t))))

;; (shared-examples-for "describe using shared examples"
;;   (it "should run the shared example"
;;     (=> (cons 1 '(2)) should = '(1 2))))

;; (describe "describe, using shared and other examples"
;;   (it-should-behave-like "describe using shared examples")
  
;;   (it "should run the regular example"
;;     (=> (= 3 3) should = t)))