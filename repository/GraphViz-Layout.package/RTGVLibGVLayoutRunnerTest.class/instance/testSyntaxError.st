tests
testSyntaxError
	| err |
	err := nil.
	runner onError: [ :errMsg | err := errMsg ].
	runner graph: self newBrokenGraph.
	runner run.
	self assert: err isNotNil.
	self assert: (err includesSubstring: 'syntax error').
	self testCleanUp