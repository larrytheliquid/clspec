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
      (princ (format nil "~%Running Specifications:~%"))
      (let ((examples-count 0) (failures-count 0))
	(dolist (example-group example-groups)
	  (loop for example in (examples example-group)
	     for success = (eval (behavior example))
	     do (incf examples-count)
	     do (unless success (incf failures-count))
	     do (princ (if success "." "F"))))
	(princ (format nil "~%~%~D Examples, ~D Failures~%"
		           examples-count failures-count))))
    (values))

  (defun clear-examples ()
    (setf shared-examples (make-hash-table :test #'equal))
    (setf example-groups ())))