(in-package :clspec)

(defmacro stub (function-name returns)
  `(setf (symbol-function ',function-name)
	 (lambda () ,(second returns))))