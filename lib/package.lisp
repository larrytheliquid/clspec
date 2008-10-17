(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow #:describe)
  (:export #:describe #:shared-examples-for #:before
	   #:it-should-behave-like #:it #:=>
	   #:with-stubs #:stub
	   #:spec #:run-examples #:clear-examples
	   #:rpush))