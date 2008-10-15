(clspec:spec)

(defun my-function () "original")

(describe "stub"
  (it "should replace the function"
    (stub my-function (returns "stubbed"))
    (=> (my-function) should = "stubbed")))