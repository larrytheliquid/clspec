(in-package :clspec)

(defclass example ()
  ((description :initarg :description
		:accessor description)
   (behavior :initarg :behavior
	     :accessor behavior)))

(defmethod run ((example example))
  (eval `(with-stubs ,@(behavior example))))

(defclass example-group ()
  ((description :initarg :description
		:accessor description)
   (examples :initform ()
             :initarg :examples
	     :accessor examples)))

(defmethod elaborate-description ((example-group example-group) elaboration)
  (setf (description example-group)
	(concatenate 'string (description example-group) " " elaboration)))

(defmethod register ((example-group example-group) (registrant example))
  (enqueue registrant (examples example-group)))