(in-package #:clspec)

(let ((examples ()))  
  (defmacro describe (description &body behavior)    
    `(progn ,@behavior))

  (defmacro it (description &body behavior)
    `(add-example ,@behavior))

  (defmacro => (form should matcher result)
    `(equalp ,form ,result))

  (defmacro add-example (example)
    (enqueue example examples)
    ())

  (defun run-examples ()
    (loop for example in examples
       for success = (eval example)       	 
       count (not success) into failures-count       
       do (princ (if success "." "F"))
       finally (unless (null examples)
		 (princ (format nil
				"~%~%~D Examples, ~D Failures"
				(length examples) failures-count))))
    (values))

  (defun clear-examples ()    
    (setf examples ()))

  (defmacro spec (&body packages)    
    `(progn (defpackage #:specifications
	      (:use #:common-lisp)
	      (:shadowing-import-from #:clspec #:describe)
	      (:use #:clspec ,@packages))
	    (in-package :specifications))))