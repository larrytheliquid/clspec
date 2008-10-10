(load "Sites/clspec/clspec.lisp")

(clspec:describe "#'describe, without examples")

(clspec:describe "#'describe, with 1 example"
  ("should run the single example"
     (clspec:=> (append '(1 2) '(3 4)) should = '(1 2 3 4))))

(clspec:describe "#'describe, with 2 examples"
  ("should run the first example"
     (clspec:=> (1+ 6) should = 7))
  ("should run the second example"
     (clspec:=> (1- 6) should = 5)))

(clspec:run-examples)