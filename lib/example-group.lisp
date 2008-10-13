(in-package :clspec)

(defclass example ()
  ((description :initarg :description
		:accessor description)))

(defclass example-group ()
  ((description :initarg :description
		:accessor description)))

(defmethod elaborate-description ((example-group example-group) elaboration)
  (setf (description example-group)
	(concatenate 'string (description example-group) " " elaboration)))