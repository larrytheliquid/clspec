(clspec:clear-examples)

(clspec:describe "enqueue, on a variable set to an empty list"
  (clspec:it "should add the element to the list"
    (let ((my-queue ()))
      (clspec:enqueue 1 my-queue)
      (clspec:=> my-queue should = '(1)))))

(clspec:describe "enqueue, on a variable set to a non-empty list"
  (clspec:it "should add the element to the front of the list"
    (let ((my-queue '(2 3)))
      (clspec:enqueue 1 my-queue)
      (clspec:=> my-queue should = '(1 2 3)))))

(clspec:run-examples)