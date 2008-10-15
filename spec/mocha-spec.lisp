(clspec:spec)

(defun my-function () "original")

(describe "my-function"
  (it "should be its initial definition"
    (=> (my-function) should = "original")))

(describe "with-stubs, stubbing a function"
  (it "should have the original function outside of body"
    (with-stubs
      (stub my-function (returns "stubbed")))
    (=> (my-function) should = "original"))
  
  (it "should have the stubbed function inside of body"
    (with-stubs
      (stub my-function (returns "stubbed"))
      (=> (my-function) should = "stubbed"))))