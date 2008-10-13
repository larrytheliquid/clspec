(defpackage #:clspec
  (:use #:common-lisp)
  (:shadow #:describe)
  (:export #:describe #:shared-examples-for
	   #:it-should-behave-like #:it #:=>
	   #:spec #:run-examples #:clear-examples
	   #:enqueue))