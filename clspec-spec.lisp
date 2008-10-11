(clspec:clear-examples)

(clspec:describe "#'describe, without examples")

(clspec:describe "#'describe, with 1 example"
  (clspec:it "should run the single example"
     (clspec:=> (append '(1 2) '(3 4)) should = '(1 2 3 4))))

(clspec:describe "#'describe, with 2 examples"
  (clspec:it "should run the first example"
     (clspec:=> (1+ 6) should = 7))
  (clspec:it "should run the second example"
     (clspec:=> (1- 6) should = 5)))

(clspec:run-examples)