(clspec:spec)

(describe "describe, without examples")

(describe "describe, with 1 example"
  (it "should run the single example"
    (=> (append '(1 2) '(3 4)) should = '(1 2 3 4))))

(describe "describe, with 2 examples"
  (it "should run the first example"
    (=> (1+ 6) should = 7))
  (it "should run the second example"
    (=> (1- 6) should = 5)))

(run-examples)