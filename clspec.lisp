(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow describe)
  (:export describe run-examples))
(in-package #:clspec)

(let ((examples (list)))
  (defmacro add-example (example)
    (setf examples
	  (nconc examples (list (lambda () example))))
    nil)

  (defmacro describe (description behavior)
    `(add-example (=> (rest (second ,behavior)))))

  (defmacro => (form should matcher result)
    `(equalp ,form ,result))

  (defun run-examples ()
    (loop for example in examples
       for result = (funcall example)
       count (not result) into failures-count
       do (princ (if result "." "F"))
       finally (princ (format nil
			      "~%~%~D Examples, ~D Failures"
			      (length examples) failures-count)))  
    (values)))