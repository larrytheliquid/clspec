(clspec:spec)

(describe "example-group"
  (describe "description"
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
	(=> (description example-group) should = "description elaborated")))))