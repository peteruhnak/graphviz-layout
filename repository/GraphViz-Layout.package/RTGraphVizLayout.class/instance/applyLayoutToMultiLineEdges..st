hook
applyLayoutToMultiLineEdges: aCollection
	| allEdges e |
	allEdges := directed , undirected.
	aCollection
		do:
			[ :each | 
			e := allEdges at: (self indexFor: each).
			e view removeEdge: e.
			e view signalUpdate.
			e shape block: [ :first :last | (self edgePathToMultiLineFor: each)].
			e resetShape.
			e view add: e.
			e view signalUpdate ].
	allEdges ifNotEmpty: [ allEdges anyOne view signalUpdate ]