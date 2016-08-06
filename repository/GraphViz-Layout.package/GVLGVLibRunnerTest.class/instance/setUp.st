running
setUp
	super setUp.
	runner := GVLGVLibRunner new.
	runner onSuccess: [ :res |  ].
	runner graph: self newGraph.
	runner timeout: 1.