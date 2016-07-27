instance creation
newBrokenGraph
	^ GraphViz new
		addNewNode: 'A' -> 'B';
		yourself