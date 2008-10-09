(load "Sites/clspec/clspec.lisp")

(clspec:describe "append"
  ("should add two lists"
    (=> (append '(1 2) '(3 4)) should = '(1 2 3 4))))

(clspec:run-examples)