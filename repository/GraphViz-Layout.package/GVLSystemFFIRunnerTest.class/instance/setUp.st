running
setUp
	super setUp.
	runner := GVLSystemFFIRunner new.
	runner onSuccess: [ :res | ].
	runner graph: self newGraph