(clspec:spec)

(describe "example's description"
  (it "should be readable"
    (let ((example (make-instance 'example
				  :description "description")))
      (=> (description example) should = "description")))

  (it "should be writeable"
    (let ((example (make-instance 'example
				  :description "description")))
      (setf (description example) "changed description")
      (=> (description example) should = "changed description"))))

(describe "example-group's description"
  (it "should be readable"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (=> (description example-group) should = "description")))

  (it "should be writeable"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (setf (description example-group) "changed description")
      (=> (description example-group) should = "changed description")))

  (it "should be elaborateable"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (elaborate-description example-group "elaborated")
      (=> (description example-group) should = "description elaborated"))))

(describe "example-group's examples"
  (it "should be an empty list by default"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (=> (examples example-group) should = ())))
  
  (it "should be readable"
    (let* ((example (make-instance 'example
				   :description "description"))
	   (example-group (make-instance 'example-group
					 :description "description"
					 :examples (list example))))
      (=> (examples example-group) should = (list example))))

  (it "should be registerable"
    (let ((example (make-instance 'example
				  :description "description"))
	  (example-group (make-instance 'example-group
					:description "description")))
      (register example-group example)
      (=> (examples example-group) should = (list example)))))