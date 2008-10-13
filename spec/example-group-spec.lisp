(clspec:spec)

(describe "example-group"
  (it "should be testable without being exported"
    (=> (example-group) should = "example group")))