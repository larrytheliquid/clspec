(asdf:defsystem #:clspec
  :description "Behaviour Driven Development framework for Common Lisp"
  :author "Larry Diehl <larrytheliquid@gmail.com>"
  :maintainer "Larry Diehl <larrytheliquid@gmail.com>"
  :licence "MIT License"
  :components ((:file "lib/package")
	       (:file "lib/utilities"
		      :depends-on ("lib/package"))
	       (:file "lib/clspec"
		      :depends-on ("lib/package" "lib/utilities"))
	       (:file "spec/clspec-spec"
		      :depends-on ("lib/package" "lib/utilities"
	                           "lib/clspec"))
	       (:file "spec/utilities-spec"
		      :depends-on ("lib/package" "lib/utilities"
				   "lib/clspec"))
	       (:file "spec/run"
		      :depends-on ("spec/clspec-spec" "spec/utilities-spec"))))