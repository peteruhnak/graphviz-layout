tests
testCleanUp
	runner run.
	self deny: (runner base , 'dot') exists.
	self deny: (runner base , 'svg') exists.
	self deny: (runner base , 'ret') exists.
	self deny: (runner base , 'pid') exists.
	self deny: (runner base , 'err') exists