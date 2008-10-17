(clspec:spec)

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

(describe "dequeue, on a variable set to an empty list"
  (it "should be nil"
    (let ((my-queue ()))
      (dequeue my-queue)
      (=> my-queue should = nil))))

(describe "dequeue, on a variable set to a non-empty list"
  (it "should remove the element from the end of the list"
    (let ((my-queue '(1 2 3)))
      (dequeue my-queue)
      (=> my-queue should = '(1 2)))))