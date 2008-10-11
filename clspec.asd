(asdf:defsystem #:clspec
  :description "Behaviour Driven Development framework for Common Lisp"
  :author "Larry Diehl <larrytheliquid@gmail.com>"
  :maintainer "Larry Diehl <larrytheliquid@gmail.com>"
  :licence "MIT License"
  :components ((:file "package")
	       (:file "clspec" :depends-on ("package" "utilities"))
	       (:file "clspec-spec" :depends-on ("clspec"))
	       (:file "utilities" :depends-on ("package"))
	       (:file "utilities-spec" :depends-on ("utilities"))))