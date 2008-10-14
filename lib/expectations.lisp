(in-package :clspec)

(defclass expectation ()
  ((expected :initarg :expected
	     :reader expected)
   (actual :initarg :actual
	   :reader actual)))

(defmethod passedp ((expectation expectation))
  (equalp (expected expectation) (actual expectation)))