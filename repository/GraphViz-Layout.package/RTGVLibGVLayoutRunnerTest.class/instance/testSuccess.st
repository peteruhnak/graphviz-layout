tests
testSuccess
	| svg |
	svg := nil.
	runner onSuccess: [ :res | svg := res ].
	runner run.
	self assert: svg isNotNil.
	self assert: svg isNotEmpty.
	self testCleanUp