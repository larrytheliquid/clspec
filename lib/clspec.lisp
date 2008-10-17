(in-package #:clspec)

(let ((example-groups ())
      (shared-examples (make-hash-table :test #'equal))
      (describe-nests ()))
  (defmacro describe (description &body behavior)
    (rpush (make-instance 'example-group
			  :description description)
	   example-groups)
    (enter-describe description)    
    `(progn ,@behavior (exit-describe)))

  (defmacro before (variables &body behavior)
    (setf (befores (current-example-group))
	  (make-instance 'before :variables variables :behavior behavior))
    ())

  (defmacro shared-examples-for (description &body behavior)
    (setf (gethash description shared-examples) behavior)
    ())

  (defmacro it-should-behave-like (description)
    `(progn ,@(gethash description shared-examples)))

  (defmacro it (description &body behavior)
    (register (current-example-group)	      
	      (make-instance 'example
			     :description description
			     :behavior behavior))
    ())

  (defmacro => (form should matcher result)
    `(make-instance 'expectation :expected ,result :actual ,form))

  (defun run-examples ()
    (unless (null example-groups)
      (let ((examples-count 0) (failures-count 0) (failures-summary ""))
	(dolist (example-group example-groups)
	  (format t "~%~A~%" (description example-group))
	  (loop for example in (examples example-group)
	     for expectation = (run example)
	     for success = (passedp expectation)
	     do (incf examples-count)
	     unless success do (incf failures-count)
	       and do (setf failures-summary
			 (concatenate 'string failures-summary
				      (summarize-failure example-group
							 example
							 expectation
							 failures-count)))
	     do (format t "- ~A~A~%" (description example)
			           (if success ""
				       (format nil " (FAILED - ~D)"
					           failures-count)))))
	(unless (equal failures-summary "")
	  (format t "~A" failures-summary))
	(format t "~%~D Examples, ~D Failures~%"
		examples-count failures-count)))
    (values))

  (defun clear-examples ()
    (setf shared-examples (make-hash-table :test #'equal))
    (setf example-groups ()))

  (defun current-example-group ()
    (first (last example-groups)))

  (defun enter-describe (description)
    (unless (null describe-nests)
      (setf (description (current-example-group))
	    (reduce (lambda (x y) (format nil "~A ~A" x y))
		    (append describe-nests
			    (list (description (current-example-group)))))))
    (rpush description describe-nests))

  (defmacro exit-describe ()
    (rpop describe-nests)
    ())

  (defun summarize-failure (example-group example expectation failure-num)
    (format nil
	    "~%~D)~%'~A ~A' FAILED~%expected: ~D~%     got: ~D (using equalp)~%"
	    failure-num
	    (description example-group)
	    (description example)
	    (expected expectation)
	    (actual expectation))))