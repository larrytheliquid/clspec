(asdf:defsystem #:clspec
  :description "Behaviour Driven Development framework for Common Lisp"
  :author "Larry Diehl <larrytheliquid@gmail.com>"
  :maintainer "Larry Diehl <larrytheliquid@gmail.com>"
  :licence "MIT License"
  :components ((:file "lib/package")
	       (:file "lib/utilities"
		      :depends-on ("lib/package"))
	       (:file "lib/expectations"
		      :depends-on ("lib/package"
				   "lib/utilities"))
	       (:file "lib/examples"
		      :depends-on ("lib/package"
				   "lib/utilities"
				   "lib/expectations"))
	       (:file "lib/clspec"
		      :depends-on ("lib/package"
				   "lib/utilities"
				   "lib/expectations"
				   "lib/examples"))
	       (:file "spec/clspec-spec"
		      :depends-on ("lib/clspec"))
	       (:file "spec/examples-spec"
		      :depends-on ("lib/examples"))
	       (:file "spec/expectations-spec"
		      :depends-on ("lib/expectations"))
	       (:file "spec/utilities-spec"
		      :depends-on ("lib/utilities"))	       
	       (:file "spec/run"
		      :depends-on ("spec/clspec-spec"
				   "spec/examples-spec"
				   "spec/expectations-spec"
				   "spec/utilities-spec"))))