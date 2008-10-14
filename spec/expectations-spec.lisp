(clspec:spec)

(describe "expectation's passedp"
  (it "should be t when expected equals actual"
    (let ((expectation (make-instance 'expectation
				      :expected (cons 1 '(2 3))
				      :actual '(1 2 3))))
      (=> (passedp expectation) should = t)))

  (it "should be nil when expected does not equal actual"
    (let ((expectation (make-instance 'expectation
				      :expected (cons 1 '(2 3))
				      :actual '(5 6 8))))
      (=> (passedp expectation) should = nil))))

(describe "expectation's expected"
  (it "should be readable"
    (let ((expectation (make-instance 'expectation
				      :expected (cons 1 '(2 3))
				      :actual '(1 2 3))))
      (=> (expected expectation) should = '(1 2 3)))))

(describe "expectation's actual"
  (it "should be readable"
    (let ((expectation (make-instance 'expectation
				      :expected (cons 1 '(2 3))
				      :actual '(1 2 3))))
      (=> (actual expectation) should = '(1 2 3)))))