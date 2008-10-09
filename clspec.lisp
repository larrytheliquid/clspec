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
    (list 'add-example (cons '=> (rest (second behavior)))))

  (defmacro => (form should matcher result)
    `(equalp ,form ,result))

  (defun run-examples ()
    (loop for example in examples
       for result = (funcall example)
       count result into pass-count
       do (princ (if result "." "F"))
       finally (princ (format nil
			      "~%~%~D Examples, ~D Failures"
			      pass-count
			      (- (length examples) pass-count))))  
    (values)))

(clspec:describe "append"
  ("should add two lists"
    (=> (append '(1 2) '(3 4)) should = '(1 2 3 4))))

(clspec:run-examples)