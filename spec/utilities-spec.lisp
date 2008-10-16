(clspec:spec)

(describe "enqueue, on a variable set to an empty list"
  (it "should add the element to the list"
    (let ((my-queue ()))
      (enqueue 1 my-queue)
      (=> my-queue should = '(1)))))

(describe "enqueue, on a variable set to a non-empty list"
  (it "should add the element to the front of the list"
    (let ((my-queue '(1 2)))
      (enqueue 3 my-queue)
      (=> my-queue should = '(1 2 3)))))

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