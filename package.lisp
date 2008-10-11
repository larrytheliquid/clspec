(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow #:describe)
  (:export #:describe #:it #:=>
	   #:spec #:run-examples #:clear-examples
	   #:enqueue))