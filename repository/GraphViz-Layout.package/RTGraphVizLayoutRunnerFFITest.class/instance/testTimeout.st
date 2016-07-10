tests
testTimeout
	self skip
"	| err |
	err := nil.
	runner onError: [ :errMsg | err := errMsg ].
	runner timeout: 0.
	runner graph: self newGraph.
	runner run.
	self assert: err isNotNil.
	self assert: (err includesSubstring: 'syntax error').
	self testCleanUp"