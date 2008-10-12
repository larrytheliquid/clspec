(clspec:spec)

(describe "enqueue, on a variable set to an empty list"
  (it "should add the element to the list"
    (let ((my-queue ()))
      (enqueue 1 my-queue)
      (=> my-queue should = '(1)))))

(describe "enqueue, on a variable set to a non-empty list"
  (it "should add the element to the front of the list"
    (let ((my-queue '(2 3)))
      (enqueue 1 my-queue)
      (=> my-queue should = '(1 2 3)))))