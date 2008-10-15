(clspec:spec)

(defun stub-me () "original")

(describe "stub-me"
  (it "should be its initial definition"
    (=> (stub-me) should = "original")))

(describe "with-stubs, stubbing a function"
  (it "should have the original function outside of body"
    (with-stubs
      (stub stub-me (returns "stubbed")))
    (=> (stub-me) should = "original"))
  
  (it "should have the stubbed function inside of body"
    (with-stubs
      (stub stub-me (returns "stubbed"))
      (=> (stub-me) should = "stubbed")))

  (it "should accept any number of arguments"
    (with-stubs
      (stub stub-me (returns "stubbed"))
      (=> (stub-me 1 2 3) should = "stubbed"))))