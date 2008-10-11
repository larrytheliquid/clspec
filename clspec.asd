(asdf:defsystem #:clspec
  :description "Behaviour Driven Development framework for Common Lisp"
  :author "Larry Diehl <larrytheliquid@gmail.com>"
  :maintainer "Larry Diehl <larrytheliquid@gmail.com>"
  :licence "MIT License"
  :components ((:file "clspec" :depends-on ("utilities"))
	       (:file "clspec-spec" :depends-on ("clspec"))
	       (:file "utilities")
	       (:file "utilities-spec" :depends-on ("utilities"))))