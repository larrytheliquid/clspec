(in-package #:clspec)

(let ((example-groups ()) (shared-examples (make-hash-table :test #'equal)))  
  (defmacro describe (description &body behavior)
    (enqueue (make-instance 'example-group
			    :description description)
	     example-groups)
    `(progn ,@behavior))

  (defmacro shared-examples-for (description &body behavior)
    (setf (gethash description shared-examples) behavior)
    ())

  (defmacro it-should-behave-like (description)
    `(progn ,@(gethash description shared-examples)))

  (defmacro it (description &body behavior)
    (register (current-example-group)
	      (make-instance 'example
			     :description description
			     :behavior (first behavior)))
    ())

  (defmacro => (form should matcher result)
    `(equalp ,form ,result))

  (defun current-example-group ()
    (first (last example-groups)))

  (defun run-examples ()
    (unless (null example-groups)
      (let ((examples-count 0) (failures-count 0))
	(dolist (example-group example-groups)
	  (format t "~%~A~%" (description example-group))
	  (loop for example in (examples example-group)
	     for success = (eval (behavior example))
	     do (incf examples-count)
	     unless success do (incf failures-count)
	     do (format t "- ~A~A~%" (description example)
			           (if success ""
				       (format nil " (FAILED - ~D)"
					           failures-count)))))
	(format t "~%~D Examples, ~D Failures~%"
		  examples-count failures-count)))
    (values))

  (defun clear-examples ()
    (setf shared-examples (make-hash-table :test #'equal))
    (setf example-groups ())))