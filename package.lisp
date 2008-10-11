(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow #:describe)
  (:export #:describe #:it #:=>
	   #:run-examples #:clear-examples
	   #:enqueue))