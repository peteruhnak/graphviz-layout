running
setUp
	super setUp.
	runner := RTGraphVizLayoutRunnerFFI new.
	runner onSuccess: [ :res | ].
	runner graph: self newGraph