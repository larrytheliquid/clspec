(in-package :clspec)

(defclass example-group ()
  ((description :initarg :description
		:accessor description)))

(defmethod elaborate-description ((e-g example-group) elaboration)
  (setf (description e-g)
	(concatenate 'string (description e-g) " " elaboration)))