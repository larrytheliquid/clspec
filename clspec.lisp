(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow describe)
  (:export describe it => run-examples))
(in-package #:clspec)

(let ((examples (list)))  
  (defmacro describe (description &body behavior)
    `(progn ,@behavior)
    )

  (defmacro it (description &body behavior)
    `(add-example ,@behavior))

  (defmacro => (form should matcher result)
    `(equalp ,form ,result))

  (defmacro add-example (example)
    (setf examples
	  (nconc examples (list example)))
    ())

  (defun run-examples ()
    (loop for example in examples
       for success = (eval example)
       count (not success) into failures-count
       do (princ (if success "." "F"))
       finally (princ (format nil
			      "~%~%~D Examples, ~D Failures"
			      (length examples) failures-count)))  
    (values)))