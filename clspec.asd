(asdf:defsystem #:clspec
  :description "Behaviour Driven Development framework for Common Lisp"
  :author "Larry Diehl <larrytheliquid@gmail.com>"
  :maintainer "Larry Diehl <larrytheliquid@gmail.com>"
  :licence "MIT License"
  :components ((:module "lib"
			:components ((:file "package")
				     (:file "utilities"
					    :depends-on ("package"))
				     (:file "clspec"
					    :depends-on ("package"
							 "utilities")))
			:in-order-to ((spec-op (load-op "spec"))))
	       (:module "spec"
			:components ((:file "clspec-spec")
				     (:file "utilities-spec"))
			:depends-on ("lib"))))