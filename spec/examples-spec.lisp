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
  (before ((before
 	    (make-instance 'before :variables '((my-var 1337))))))
  
  (it "should be initializeable and readable"
    (=> (variables before) should = '((my-var 1337)))))

(describe "before's behavior"
  (before ((before
 	    (make-instance 'before :variables '((1+ 2))))))
  
  (it "should be initializeable and readable"
    (=> (variables before) should = '((1+ 2)))))

(describe "example-group's beforep"
  (it "should be nil by default"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (=> (beforep example-group) should = nil)))
  
  (it "should be t with before-variables"
    (let ((example-group (make-instance 'example-group
					:description "description")))      
      (setf (before-variables example-group) '((my-var 1337)))
      (=> (beforep example-group) should = t)))

  (it "should be t with before-behavior"
    (let ((example-group (make-instance 'example-group
					:description "description")))
      (setf (before-behavior example-group) '((1+ 2)))
      (=> (beforep example-group) should = t))))

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
	  (example-group (make-instance 'example-group
					:description "description")))
      (setf (before-variables example-group) '((my-variable 1335)))
      (setf (before-behavior example-group) '((incf my-variable)))
      (register example-group example)
      (=> (run example) should = 1337))))