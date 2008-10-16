(in-package #:clspec)

;; (defmacro spec (&body packages)    
;;     `(progn (defpackage #:specifications
;; 	      (:use #:common-lisp)
;; 	      (:shadowing-import-from #:clspec #:describe)
;; 	      (:use #:clspec ,@packages))
;; 	    (in-package :specifications)))

(defmacro spec (&optional (package :clspec))    
    `(in-package :clspec))

(defmacro enqueue (value queue)
  `(setf ,queue (append ,queue (list ,value))))

(defmacro dequeue (queue)
  `(setf ,queue (butlast ,queue)))