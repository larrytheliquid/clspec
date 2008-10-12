(in-package #:clspec)

(defmacro enqueue (value queue)
  `(setf ,queue (cons ,value ,queue)))