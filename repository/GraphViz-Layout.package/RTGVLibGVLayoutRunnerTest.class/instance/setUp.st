running
setUp
	super setUp.
	runner := RTGVLayoutGVLibRunner new.
	runner onSuccess: [ :res |  ].
	runner graph: self newGraph.
	runner timeout: 1.