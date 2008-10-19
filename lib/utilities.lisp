(in-package #:clspec)

;; (defmacro spec (&body packages)    
;;     `(progn (defpackage #:specifications
;; 	      (:use #:common-lisp)
;; 	      (:shadowing-import-from #:clspec #:describe)
;; 	      (:use #:clspec ,@packages))
;; 	    (in-package :specifications)))

(defmacro spec (&optional (package :clspec))    
    `(in-package :clspec))

(defmacro rpeek (stack)
  `(first (last ,stack)))

(defmacro rpush (value stack)
  `(setf ,stack (append ,stack (list ,value))))

(defmacro rpop (stack)
  `(setf ,stack (butlast ,stack)))