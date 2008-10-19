(clspec:spec)

(describe "rpeek, on a variable set to an empty list"
  (it "should be nil"
    (let ((my-stack ()))      
      (=> (rpeek my-stack) should = nil))))

(describe "rpeek, on a variable set to a non-empty list"
  (it "should be the element at the end of the list"
    (let ((my-stack '(1 2)))      
      (=> (rpeek my-stack) should = 2))))

(describe "rpush, on a variable set to an empty list"
  (it "should add the element to the list"
    (let ((my-stack ()))
      (rpush 1 my-stack)
      (=> my-stack should = '(1)))))

(describe "rpush, on a variable set to a non-empty list"
  (it "should add the element to the front of the list"
    (let ((my-stack '(1 2)))
      (rpush 3 my-stack)
      (=> my-stack should = '(1 2 3)))))

(describe "rpop, on a variable set to an empty list"
  (it "should be nil"
    (let ((my-stack ()))
      (rpop my-stack)
      (=> my-stack should = nil))))

(describe "rpop, on a variable set to a non-empty list"
  (it "should remove the element from the end of the list"
    (let ((my-stack '(1 2 3)))
      (rpop my-stack)
      (=> my-stack should = '(1 2)))))