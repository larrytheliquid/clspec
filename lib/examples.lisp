(in-package :clspec)

(defclass before ()
  ((variables :initarg :variables
	      :reader variables)
   (behavior :initarg :behavior
	     :reader behavior)))

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
   (befores :initform ()
	    :initarg :befores
	    :accessor befores)
   (examples :initform ()
             :initarg :examples
	     :accessor examples)))

(defmethod elaborate-description ((example-group example-group) elaboration)
  (setf (description example-group)
	(concatenate 'string (description example-group) " " elaboration)))

(defmethod register ((example-group example-group) (example example))
  (unless (null (befores example-group))
    (dolist (before (reverse (befores example-group)))
      (wrapn example before)))
  (rpush example (examples example-group)))

(defmethod wrapn ((example example) (before before))
  (setf (behavior example)
	`((let* ,(variables before)
	  ,@(behavior before)
	  ,@(behavior example)))))

(defmethod behavior-wrappend-in-before ((example-group example-group)
					(example example))
  `((let* ,(variables (befores example-group))
	  ,@(behavior (befores example-group))
	  ,@(behavior example))))