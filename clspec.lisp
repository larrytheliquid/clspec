(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow describe)
  (:export describe run-examples))
(in-package #:clspec)

(defmacro add-example (example)
  `(progn (defvar *examples* ())
	  (setf *examples*
		(nconc *examples* (list (lambda () ,example))))))

(defmacro describe (description behavior)
  (list 'add-example (cons '=> (rest (second behavior)))))

(defmacro => (form should matcher result)
  `(equalp ,form ,result))

(clspec:describe "append"
  ("should add two lists"
    (=> (append '(1 2) '(3 4)) should = '(1 2 3 4))))

(defun run-examples ()
  (loop for example in *examples*
        for result = (funcall example)
        count result into pass-count
        do (princ (if result "." "F"))
        finally (princ (format nil
			       "~%~%~D Examples, ~D Failures"
			       pass-count
			       (- (length *examples*) pass-count))))  
  (values))