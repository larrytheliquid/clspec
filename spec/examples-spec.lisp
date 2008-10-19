(clspec:spec)

(defun stub-me () "original")

(describe "example's description"
  (it "should be initializeable and readable"
    (let ((example (make-instance 'example
				  :description "description")))
      (=> (description example) should = "description")))

  (it "should be readable and writeable"
    (let ((example (make-instance 'example
				  :description "description")))
      (setf (description example) "changed description")
      (=> (description example) should = "changed description"))))

(describe "example's behavior"
  (it "should be initializeable and readable"
    (let ((example (make-instance 'example
				  :behavior '((1+ 2)))))
      (=> (behavior example) should = '((1+ 2)))))

  (it "should be writeable and readable"
    (let ((example (make-instance 'example
				  :behavior '((1+ 2)))))
      (setf (behavior example) '((1+ 1336)))
      (=> (behavior example) should = '((1+ 1336)))))

  (it "should be runnable, returning the last statement"
    (let ((example (make-instance 'example
				  :behavior '((1- 2) (1+ 2)))))
      (=> (run example) should = 3)))

  (it "should be runnable, inside of an implicit with-stubs"
    (let ((example (make-instance 'example
				  :behavior '((stub stub-me
					            (returns "stubbed"))
					      (stub-me)))))
      (=> (run example) should = "stubbed"))))

(describe "example-group's description"
  (it "should be initializeable and readable"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (=> (description example-group) should = "description")))

  (it "should be writeable and readable"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (setf (description example-group) "changed description")
      (=> (description example-group) should = "changed description")))

  (it "should be elaborateable"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (elaborate-description example-group "elaborated")
      (=> (description example-group) should = "description elaborated"))))

(describe "before's variables"
  (before ((before (make-instance 'before :variables '((my-var 1337))))))
  
  (it "should be initializeable and readable"
    (=> (variables before) should = '((my-var 1337)))))

(describe "before's behavior"
  (before ((before (make-instance 'before :behavior '((1+ 2))))))
  
  (it "should be initializeable and readable"
    (=> (behavior before) should = '((1+ 2)))))

(describe "example-groups's befores"
  (before ((before (make-instance 'before :behavior '((1+ 2))))
	   (example-group (make-instance 'example-group))))

  (it "should be empty by default"
    (=> (befores example-group) should = ()))

  (it "should be writeable and readable"
    (rpush before (befores example-group))
    (=> (befores example-group) should = (list before))))

(describe "example-group's examples"
  (it "should be an empty list by default"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (=> (examples example-group) should = ())))
  
  (it "should be writeable and readable"
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
      (=> (examples example-group) should = (list example))))

  (it "should wrap before in example-groups before block"
    (let ((example (make-instance 'example
				  :description "description"
				  :behavior '((1+ my-variable))))
	  (before (make-instance 'before
				 :variables '((my-variable 1335))
				 :behavior '((incf my-variable))))
	  (example-group (make-instance 'example-group
					:description "description")))
      (rpush before (befores example-group))
      (register example-group example)
      (=> (run example) should = 1337))))