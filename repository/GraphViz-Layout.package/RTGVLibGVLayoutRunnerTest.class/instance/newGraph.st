instance creation
newGraph
	^ GraphViz new
		beDirected;
		add: 'A' -> 'B';
		yourself